import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/material_color.dart';

class FilterSelected extends StatefulWidget {
  const FilterSelected({super.key});

  @override
  _FilterSelectedState createState() => _FilterSelectedState();
}

class _FilterSelectedState extends State<FilterSelected> {
  int i = 3;

  void _decrementI() {
    setState(() {
      i--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              //
            },
            child: Container(
              height: 35,
              // alignment: Alignment.center,
              margin: EdgeInsets.only(right: 5, bottom: 5, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: myMaterialColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.list_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Filter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int j = 1; j <= i; j++)
                  Container(
                    height: 35,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5, bottom: 5, left: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3),
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
                            onPressed: () {
                              _decrementI();
                            },
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
          ),
        ),
      ],
    );
  }
}
