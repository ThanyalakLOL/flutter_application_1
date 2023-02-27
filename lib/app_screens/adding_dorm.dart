import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Adding extends StatefulWidget {
  const Adding({Key? key}) : super(key: key);

  @override
  State<Adding> createState() => _AddingState();
}

class _AddingState extends State<Adding> {
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adding"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Dormitory name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    width: width,
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Select your dormitory',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 200,
                          itemHeight: 40,
                          dropdownMaxHeight: 200,
                          searchController: textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search for an item...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return (item.value
                                .toString()
                                .contains(searchValue));
                          },
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Insert Picture",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // color: Colors.cyanAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Image.asset("images/iconimage.png"),
                          height: 80,
                        ),
                        Expanded(
                            child: Container(
                          child: Center(
                            child: Text(
                              "Add pictures",
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Select domitory's facilities",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Facility(
                    facilities: [
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
          ],
        ),
      ),
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
      return Colors.red;
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
    int mid = (widget.facilities.length / 2).ceil();
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
          Expanded(
            child: Column(
              children: secondHalf
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
        Text(facility),
      ],
    );
  }
}
