import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/adding_dorm.dart';
import 'package:flutter_application_1/app_screens/create_acoount.dart';
import 'package:flutter_application_1/app_screens/detailpage.dart';
import 'package:flutter_application_1/app_screens/home_page.dart';
import 'package:flutter_application_1/app_screens/login_page.dart';
import 'package:flutter_application_1/app_screens/profile_edit_page.dart';
import 'package:flutter_application_1/app_screens/signup_page.dart';
import 'package:flutter_application_1/app_screens/wishlist_page.dart';
import 'package:flutter_application_1/app_screens/edit_varaible/edit_text_page.dart';
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
        '/adding_page': (context) => const Adding(),
        '/fav_page': (context) => const WishListDormPage(),
        '/profile_page': (context) => const ProfileEditPage(),
        '/create_account_page': (context) => const CreateAccountPage(),
        '/login_page': (context) => LoginPage(),
        '/signup_page': (context) => SignupPage(),
        '/detail_page': (context) => DetailPage(),
      },
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black87),
        primarySwatch: myMaterialColor,
      ),
    );
  }
}
