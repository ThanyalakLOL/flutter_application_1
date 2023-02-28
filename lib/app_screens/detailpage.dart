import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_color.dart';
import 'images_slider.dart';

class NameDorm extends StatefulWidget {
  const NameDorm({Key? key}) : super(key: key);

  @override
  State<NameDorm> createState() => _NameDormState();
}

class _NameDormState extends State<NameDorm> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: Text("Serenity Condo",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("หลังมอ", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 50,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/doraemon.jpg'),
                  radius: 100,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("John Wick",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Owner",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.phone,
                  color: myMaterialColor,
                  size: 30.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.message,
                  color: myMaterialColor,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ],
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
          child: Icon(
            Icons.check,
            color: myMaterialColor,
            size: 30.0,
          ),
        ),
        Text(facility),
      ],
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageSlider(),
              NameDorm(),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Text('Facilities',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Facility(
                facilities: [
                  "เครื่องทำน้ำอุ่น",
                  "ลิฟต์",
                  'แอร์',
                  'ตู้เย็น',
                  'ทีวี',
                  'โต๊ะทำงาน',
                  'เตียงเดียว',
                  'wifi',
                  'ที่จอดรถยนต์',
                  'เครื่องซักผ้า',
                  'รปภ.',
                  'ตู้เสื้อผ้า',
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Text('Cost of utilities',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ค่าน้ำ : 20 บาท/หน่วย',
                        style: TextStyle(
                            fontFamily: "Bai Jamjuree", color: Colors.black87),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ค่าไฟ : 8 บาท/หน่วย',
                        style: TextStyle(
                            fontFamily: "Bai Jamjuree", color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Text('More detail',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "ขายสัญญา Rivendell Estrella Condominium ฝั่งกังสดาล ห้อง 33 ตรม. อยู่ได้ 3 ค่าเช่าเดือนละ 8500 บาท, ค่าสัญญา 8500 บาท รวม 17000 บาท เข้าอยู่ได้วันที่ 1 เมษายน 2566 (ตอนออกได้ค่าประกันคืน 8500 นะคะ -สัญญาหมดวันที่ 31 พ.ค. 2566 ต่อได้เรื่อยๆเป็นรายปีค่ะคอนโดอยู่ใกล้แหล่งของกิน ร้านบุฟเฟต์ ร้านสะดวกซื้อ คาเฟ่ และร้านซักผ้าค่ะ",
                  style: TextStyle(
                      fontFamily: "Bai Jamjuree", color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Price",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54)),
                  ),
                  Container(
                    child: Text("5,000 Bath/Month",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: myMaterialColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Available",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
