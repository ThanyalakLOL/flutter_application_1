import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/app_screens/my_dorm_widget.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/item_widget.dart';

class MyDormToSell extends StatefulWidget {
  const MyDormToSell({super.key});

  @override
  State<MyDormToSell> createState() => _MyDormToSellState();
}

class _MyDormToSellState extends State<MyDormToSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // floatingActionButton: HomeFloatingButton(),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Dorm contract",
                style: TextStyle(
                    fontFamily: "Comfortaa",
                    // fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            IconButton(
                alignment: Alignment.bottomRight,
                onPressed: () {},
                icon: Icon(
                  Icons.manage_search_rounded,
                  color: Colors.grey[800],
                  size: 28,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "54 items",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Stack(children: [
              ItemWidget(),
              MyDormItemWidget(),
            ])
          ],
        ),
      ),
    );
  }
}
