import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_screens/adding_dorm.dart';
import 'package:flutter_application_1/app_screens/create_account.dart';
import 'package:flutter_application_1/app_screens/detailpage.dart';
import 'package:flutter_application_1/app_screens/edit_my_dorm._page.dart';
import 'package:flutter_application_1/app_screens/home_page.dart';
import 'package:flutter_application_1/app_screens/login_page.dart';
import 'package:flutter_application_1/app_screens/my_dorm_to_sell.dart';
import 'package:flutter_application_1/app_screens/profile_edit_page.dart';
import 'package:flutter_application_1/app_screens/signup_page.dart';
import 'package:flutter_application_1/app_screens/wishlist_page.dart';
import 'package:flutter_application_1/app_screens/edit_varaible/edit_text_page.dart';
import 'package:flutter_application_1/bottom_navbar.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/profile_row.dart';
import 'package:flutter_application_1/test.dart';

import 'app_screens/image_upload.dart';

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
      initialRoute: '/bottombar',
      routes: {
        '/': (context) => const CurveBottomNavbar(),
        '/adding_page': (context) => const Adding(),
        '/fav_page': (context) => WishListDormPage(),
        // '/profile_page': (context) => const ProfileEditPage(),
        '/create_account_page': (context) => const CreateAccountPage(),
        '/login_page': (context) => LoginPage(),
        '/signup_page': (context) => SignupPage(),
        '/detail_page': (context) => DetailPage(),
        '/edit_my_dorm': (context) => EditDormPage(),
        '/my_dorm_to_sell_page': (context) => MyDormToSell(),
        '/test': (context) => Test(),
        // '/bottombar': (context) => CurveBottomNavbar(),
      },
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black87),
        primarySwatch: myMaterialColor,
      ),
    );
  }
}
