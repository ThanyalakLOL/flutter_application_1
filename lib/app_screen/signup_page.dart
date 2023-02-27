import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/home_floating_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: HomeFloatingButton(),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 90),
            child: Text(
              "Profile",
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey[200],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/nobita.jpg"),
                        radius: 100,
                      ),
                      Positioned(
                        right: -10,
                        bottom: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade50,
                              width: 5,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.grey[500],
                          ),
                          child: IconButton(
                            onPressed: () {
                              //pick image from device
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 20, top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About you",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                ),
                TextFieldWithTitle(title: "Account Name", length: 30),
                TextFieldWithTitle(title: "Name", length: 50),
                Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 20, top: 10),
                    child: Text(
                      "Contact",
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                        // update the _topic variable when the user types in the TextField
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      // labelText: 'Enter text',

                      hintText: 'Enter number',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),
                ),
                TextFieldWithTitle(title: "Facebook", length: 50),
                TextFieldWithTitle(title: "ID LINE", length: 30),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class TextFieldWithTitle extends StatefulWidget {
  const TextFieldWithTitle(
      {super.key, required this.title, required this.length});
  final String title;
  final int length;

  @override
  State<TextFieldWithTitle> createState() => _TextFieldWithTitleState();
}

class _TextFieldWithTitleState extends State<TextFieldWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
                fontFamily: "Comfortaa", fontSize: 15, color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: TextFormField(
            maxLength: widget.length,
            onChanged: (value) {
              setState(() {
                // update the _topic variable when the user types in the TextField
              });
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: 'Enter ' + widget.title,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || value.length < 5) {
                return 'Text must be at least 5 characters';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
