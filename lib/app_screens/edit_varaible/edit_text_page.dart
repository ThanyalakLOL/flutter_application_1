import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/app_screens/edit_varaible/edit_phone_num_page.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/profile_row.dart';

class EdittextPage extends StatefulWidget {
  const EdittextPage({
    super.key,
    required this.length,
    required this.topic,
  });
  final int length;
  final String topic;

  @override
  State<EdittextPage> createState() => _EdittextPageState();
}

class _EdittextPageState extends State<EdittextPage> {
  String newInfo = '';
  @override
  Widget build(BuildContext context) {
    Color? saveButtonColor =
        newInfo.isNotEmpty ? myMaterialColor : Colors.grey[700];
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
                Navigator.pushNamed(context, '/');
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
              onPressed: newInfo.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileRow(
                            topic: widget.topic,
                            info: newInfo,
                            type: 'text',
                            legthInfo: widget.length,
                          ),
                        ),
                      );
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
            maxLength: widget.length,
            onChanged: (value) {
              setState(() {
                newInfo =
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
