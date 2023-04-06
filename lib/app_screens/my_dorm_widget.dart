import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/account_image_asset.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/status.dart';
import 'package:flutter_application_1/dorm_image_asset.dart';

class MyDormItemWidget extends StatefulWidget {
  const MyDormItemWidget({Key? key}) : super(key: key);

  @override
  _MyDormItemWidgetState createState() => _MyDormItemWidgetState();
}

class _MyDormItemWidgetState extends State<MyDormItemWidget> {
  List<bool> isFavoriteList = List.filled(3, false);
  List<bool> isNotificationOnList = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: screenW <= 600 ? (20 / 17) : (20 / 9),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 3; i++)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail_page');
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/nobita.jpg"))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Serenity Condo",
                                style: TextStyle(
                                    fontFamily: "Comfortaa",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 2)),
                              Text(
                                "หลังมอ",
                                style: TextStyle(
                                    fontFamily: "Bai Jamjuree",
                                    color: Colors.black87),
                              )
                            ],
                          )
                        ],
                      ),
                      dorm_image_with_status(),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "5000 BATH/MONTH",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: myMaterialColor),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/edit_my_dorm');
                                    setState(() {
                                      isFavoriteList[i] = !isFavoriteList[i];
                                    });
                                  },
                                  icon: Icon(
                                    Icons.edit_note_rounded,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
