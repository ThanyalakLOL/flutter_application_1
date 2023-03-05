import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/signup_page.dart';
import 'package:flutter_application_1/material_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                // margin: EdgeInsets.only(bottom: 20),
                width: width,
                height: height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("images/logo2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Sign into your account",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 6,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ]),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: myMaterialColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                                  15), // adjust the padding value as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 6,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ]),
                      height: 50,
                      child: TextField(
                        obscureText:
                            !_showPassword, // add this line to show dots instead of text

                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: myMaterialColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: myMaterialColor,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                                  12), // adjust the padding value as needed
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Forgot your password",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bottombar');
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: myMaterialColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
