import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/app_screens/edit_varaible/edit_text_page.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/profile_row.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key, required this.newInfo}) : super(key: key);
  final String newInfo;

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: HomeFloatingButton(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
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
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Profile",
                style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(
                    Icons.logout,
                    // size: 15,
                    color: Colors.grey[700],
                  )),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(
                            File(image!.path),
                          ),
                        )
                      : CircleAvatar(
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
                          myAlert();
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
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "Nobita",
                style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.all(10),
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
              ProfileRow(
                topic: "Account Name",
                info: "Nobita",
                legthInfo: 30,
                type: 'text',
              ),
              ProfileRow(
                topic: "Name",
                info: "Nobita Kung",
                legthInfo: 50,
                type: 'text',
              ),
              Divider(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact",
                  style: TextStyle(
                      fontFamily: "Comfortaa",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ),
              ProfileRow(
                topic: "Phone",
                info: "0822888888",
                type: 'numer',
                legthInfo: 10,
              ),
              ProfileRow(
                topic: "Facebook",
                info: "xxxx",
                legthInfo: 50,
                type: 'text',
              ),
              ProfileRow(
                topic: "ID LINE",
                info: "xxx",
                legthInfo: 30,
                type: 'text',
              )
            ],
          ),
        ),
      ),
    );
  }
}
