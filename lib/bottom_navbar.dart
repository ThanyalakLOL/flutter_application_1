import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/app_screens/adding_dorm.dart';
import 'package:flutter_application_1/app_screens/home_page.dart';
import 'package:flutter_application_1/app_screens/my_dorm_to_sell.dart';
import 'package:flutter_application_1/app_screens/profile_edit_page.dart';
import 'package:flutter_application_1/app_screens/wishlist_page.dart';
import 'package:flutter_application_1/material_color.dart';

class CurveBottomNavbar extends StatefulWidget {
  const CurveBottomNavbar({
    super.key,
  });

  @override
  State<CurveBottomNavbar> createState() => _CurveBottomNavbarState();
}

class _CurveBottomNavbarState extends State<CurveBottomNavbar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    HomePage(),
    WishListDormPage(),
    Adding(),
    MyDormToSell(),
    ProfileEditPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        // iconPadding: 20,
        key: _bottomNavigationKey,
        // height: 70,
        backgroundColor: myMaterialColor,
        // buttonBackgroundColor: Colors.amber,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_filled),
            label: 'Home',
            labelStyle: TextStyle(
                fontFamily: "Comfortaa",
                // fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite),
            label: 'Favorite',
            labelStyle:
                TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w700),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.add_home_work_rounded),
            label: 'Add',
            labelStyle:
                TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w700),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.library_books_rounded),
            label: 'Contact',
            labelStyle:
                TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w700),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.account_circle),
            label: 'Account',
            labelStyle:
                TextStyle(fontFamily: "Comfortaa", fontWeight: FontWeight.w700),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

// enum _SelectedTab { adding_dorm, favorite, chat, profile, home }
