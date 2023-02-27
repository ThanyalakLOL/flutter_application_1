import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/profile_row.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: HomeFloatingButton(),
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
