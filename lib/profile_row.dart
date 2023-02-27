import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/app_screen/edit_varaible/edit_phone_num_page.dart';
import 'package:flutter_application_1/app_screen/edit_varaible/edit_text_page.dart';

class ProfileRow extends StatefulWidget {
  ProfileRow(
      {required this.topic,
      required this.info,
      required this.legthInfo,
      required this.type});
  final String topic, info, type;
  final int legthInfo;

  @override
  State<ProfileRow> createState() => _ProfileRowState();
}

class _ProfileRowState extends State<ProfileRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.topic,
              style: TextStyle(
                  fontFamily: "Comfortaa", fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Text(
                widget.info,
                style: TextStyle(
                    fontFamily: "Bai Jamjuree",
                    fontSize: 15,
                    color: Colors.grey[700]),
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.type == 'text'
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EdittextPage(
                                    length: widget.legthInfo,
                                  )),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPhoneNumPage()),
                        );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey[700],
                ))
          ],
        )
      ],
    );
  }
}
