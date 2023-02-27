import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key, required this.topic, required this.number});
  final String topic, number;

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
                widget.number,
                style: TextStyle(
                    fontFamily: "Bai Jamjuree",
                    fontSize: 15,
                    color: Colors.grey[700]),
              ),
            ),
            IconButton(
                onPressed: () {},
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
