import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/material_color.dart';

class EditPhoneNumPage extends StatefulWidget {
  const EditPhoneNumPage({
    Key? key,
    required this.topic,
    required String currentInfo,
  }) : super(key: key);
  final String topic;
  @override
  State<EditPhoneNumPage> createState() => _EditPhoneNumPageState();
}

class _EditPhoneNumPageState extends State<EditPhoneNumPage> {
  String _topic = '';
  @override
  Widget build(BuildContext context) {
    Color? saveButtonColor =
        _topic.isNotEmpty ? myMaterialColor : Colors.grey[700];
    return Scaffold(
      floatingActionButton: HomeFloatingButton(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
            ),
            Text(
              widget.topic,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            TextButton(
              onPressed: _topic.isNotEmpty
                  ? () {
                      Navigator.pop(context);
                    }
                  : null,
              child: Text(
                'Save',
                style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color:
                        saveButtonColor), // set the color of the "Save" TextButton based on the value of the saveButtonColor variable
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            // minLines: 10,
            maxLength: 10,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            onChanged: (value) {
              setState(() {
                _topic =
                    value; // update the _topic variable when the user types in the TextField
              });
            },
            decoration: InputDecoration(
              // labelText: 'Enter text',

              hintText: 'Enter ' + widget.topic,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
