import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/account_image_asset.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/status.dart';
import 'package:flutter_application_1/dorm_image_asset.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<bool> isFavoriteList = List.filled(3, false);
  List<bool> isNotificationOnList = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: (20 / 17),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 3; i++)
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
                            backgroundImage: AssetImage("images/nobita.jpg"))),
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
                              setState(() {
                                isFavoriteList[i] = !isFavoriteList[i];
                              });
                            },
                            icon: Icon(
                              isFavoriteList[i]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavoriteList[i] ? Colors.red : null,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isNotificationOnList[i] =
                                    !isNotificationOnList[i];
                              });
                            },
                            icon: Icon(
                              isNotificationOnList[i]
                                  ? Icons.notifications_active
                                  : Icons.notifications_none_rounded,
                              color:
                                  isNotificationOnList[i] ? Colors.amber : null,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ],
    );
  }
}
