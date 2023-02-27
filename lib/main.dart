import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screen/adding_page.dart';
import 'package:flutter_application_1/app_screen/home_page.dart';
import 'package:flutter_application_1/app_screen/profile_edit_page.dart';
import 'package:flutter_application_1/app_screen/signup_page.dart';
import 'package:flutter_application_1/app_screen/wishlist_page.dart';
import 'package:flutter_application_1/app_screen/edit_varaible/edit_text_page.dart';
import 'package:flutter_application_1/material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/adding_page': (context) => const AddingPage(),
        '/fav_page': (context) => const WishListDormPage(),
        '/profile_page': (context) => const ProfileEditPage(),
        '/signup_page': (context) => const SignUpPage(),
      },
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black87),
        primarySwatch: myMaterialColor,
      ),
    );
  }
}
