import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/dorm_image_asset.dart';

Widget _buildStack() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(width: 352, height: 180, child: const DormImageAsset()),
      Positioned(
        top: 5,
        right: 5,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: myMaterialColor,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Text(
            'Available',
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      )
    ],
  );
}

class dorm_image_with_status extends StatelessWidget {
  const dorm_image_with_status({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildStack();
  }
}
