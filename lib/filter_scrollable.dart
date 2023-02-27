import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/material_color.dart';

class FilterSelected extends StatelessWidget {
  const FilterSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 8; i++)
            Container(
              height: 35,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 5, bottom: 5, left: 5),
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors
                        .black26 //                   <--- border width here
                    ),
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Text(
                    "Filter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.black54,
                        size: 20,
                      ))
                ],
              ),
            )
        ],
      ),
    );
  }
}
