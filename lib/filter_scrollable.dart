import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:side_sheet/side_sheet.dart';

class FilterSelected extends StatefulWidget {
  const FilterSelected({super.key});

  @override
  _FilterSelectedState createState() => _FilterSelectedState();
}

class _FilterSelectedState extends State<FilterSelected> {
  bool _isSelected = false;
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
        Container(
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
          child: GestureDetector(
            onTap: () => SideSheet.right(
                body: SafeArea(
                    child: Scaffold(
                  bottomNavigationBar: BottomNavBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Filters",
                                style: TextStyle(
                                    fontFamily: "Comfortaa",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ),
                            Icon(
                              Icons.list,
                              color: Colors.black,
                            )
                          ],
                        ),
                        Divider(),
                        Facility(
                          facilities: [
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี',
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี',
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี',
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี',
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี',
                            "เครื่องทำน้ำอุ่น",
                            "ลิฟต์",
                            'แอร์',
                            'ตู้เย็น',
                            'ทีวี'
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
                context: context),
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
                    "Filters",
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
          ),
        ),
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

class Chipschoice extends StatefulWidget {
  const Chipschoice({Key? key}) : super(key: key);

  @override
  State<Chipschoice> createState() => _ChipschoiceState();
}

class _ChipschoiceState extends State<Chipschoice> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return myMaterialColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class Facility extends StatefulWidget {
  final List<String> facilities;

  const Facility({Key? key, required this.facilities}) : super(key: key);

  @override
  State<Facility> createState() => _FacilityState();
}

class _FacilityState extends State<Facility> {
  @override
  Widget build(BuildContext context) {
    int mid = (widget.facilities.length / 1).ceil();
    List<String> firstHalf = widget.facilities.sublist(0, mid);
    List<String> secondHalf = widget.facilities.sublist(mid);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: firstHalf
                  .map((facility) => buildFacilityRow(facility))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFacilityRow(String facility) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Chipschoice(),
        ),
        Text(
          facility,
          style: TextStyle(fontFamily: "Bai Jamjuree", color: Colors.black),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 70,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //unselect all item
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: myMaterialColor)),
                  child: Text(
                    "Clear All",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: myMaterialColor),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  //add item filter and back home page
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: myMaterialColor,
                      ),
                      color: myMaterialColor),
                  child: Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
