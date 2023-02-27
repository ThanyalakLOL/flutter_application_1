import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
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
            ],
          ),
        ));
  }
}
