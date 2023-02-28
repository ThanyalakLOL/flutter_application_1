import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/material_color.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  final List<String> type = [
    'รายวัน',
    'รายเดือน',
  ];
  String? selectedType;

  final List<String> zone = [
    'กังสดาล',
    'หลังมอ',
    'โคลัมโบ',
    'โนนม่วง',
    'หอกาญจนา',
  ];
  String? selectedZone;

  final List<String> water_unit = [
    'บาท/เดือน',
    'บาท/หน่วย',
    'บาท/คน',
  ];
  String? selectedWater_unit;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<XFile> images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img != null) {
        images.add(img);
      }
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[200],
        title: const Text(
          "Add your contact",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    if (images != null && images!.isNotEmpty)
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images!.length,
                          itemBuilder: (context, index) {
                            final image = images![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(image.path),
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    if (images == null || images!.isEmpty)
                      Container(
                        padding: EdgeInsets.all(8),
                        width: width,
                        decoration: BoxDecoration(
                          // color: Colors.white,
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
                    GestureDetector(
                      onTap: myAlert,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: myMaterialColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Upload",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
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
                      ],
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
                      child: Text("Zone",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      width: width,
                      child: CustomDropdownButton2(
                        hint: 'Select Zone',
                        dropdownItems: zone,
                        value: selectedZone,
                        onChanged: (value) {
                          setState(() {
                            selectedZone = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Container(
                      child: Text("ค่าน้ำ/ค่าไฟ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'ค่าไฟ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            suffixText: 'Bath/Unit',
                            suffixStyle: TextStyle(color: Colors.grey),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'ค่าน้ำ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  suffixText: '',
                                  suffixStyle: TextStyle(color: Colors.grey),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                        ),
                        Container(
                          width: width * 0.6,
                          child: CustomDropdownButton2(
                            hint: 'หน่วย',
                            dropdownItems: water_unit,
                            value: selectedWater_unit,
                            onChanged: (value) {
                              setState(() {
                                selectedWater_unit = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Container(
                      child: Text("ประเภทและราคาห้องพัก",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: width * 0.4,
                          child: CustomDropdownButton2(
                            hint: 'ประเภทห้องพัก',
                            dropdownItems: type,
                            value: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'ค่าห้อง',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  suffixText: (selectedType == 'รายวัน')
                                      ? 'บาท/วัน'
                                      : ((selectedType == 'รายเดือน')
                                          ? 'บาท/เดือน'
                                          : ''),
                                  suffixStyle: TextStyle(color: Colors.grey),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Container(
                      child: Text("รายละเอียดเพิ่มเติม",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: SingleChildScrollView(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'กรอกรายละเอียด',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            suffixStyle: TextStyle(color: Colors.grey),
// Adjust the font size of the text field
                            labelStyle: TextStyle(fontSize: 18.0),
// Adjust the font size of the hint text
                            hintStyle: TextStyle(fontSize: 16.0),
                          ),
                          keyboardType: TextInputType.text,
// Remove the digitsOnly formatter to accept all strings
                          inputFormatters: <TextInputFormatter>[],
                          maxLines: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              child: Text("Cancel",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey))),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: myMaterialColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Publish",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                          ),
                        ],
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
        Center(
          child: Chipschoice(),
        ),
        Text(facility),
      ],
    );
  }
}

class DormType extends StatefulWidget {
  const DormType({Key? key}) : super(key: key);

  @override
  State<DormType> createState() => _DormTypeState();
}

class _DormTypeState extends State<DormType> {
  final List<String> type = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomDropdownButton2(
          hint: 'Select Item',
          dropdownItems: type,
          value: selectedType,
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),
      ),
    );
  }
}
