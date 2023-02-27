import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DormImageAsset extends StatelessWidget {
  const DormImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage(
      "images/dorm_img/1.jpg",
    );
    Image image = Image(
      image: assetImage,
    );
    return image;
  }
}
