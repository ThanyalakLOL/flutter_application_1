import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountImageAsset extends StatelessWidget {
  const AccountImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage(
      "images/nobita.jpg",
    );
    Image image = Image(
      image: assetImage,
    );
    return Expanded(child: image);
  }
}
