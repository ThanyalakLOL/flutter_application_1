import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_color.dart';

class SortingListView extends StatefulWidget {
  const SortingListView({Key? key}) : super(key: key);

  @override
  _SortingListViewState createState() => _SortingListViewState();
}

class _SortingListViewState extends State<SortingListView> {
  bool isNewestSelected = false;
  bool isLowToHighSelected = false;
  bool isHighToLowSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: <Widget>[
      ListTile(
        title: Text("Newest"),
        onTap: () {
          setState(() {
            isNewestSelected = true;
            isLowToHighSelected = false;
            isHighToLowSelected = false;
          });
          // Do something when Newest is tapped
        },
        trailing: Icon(
            color: myMaterialColor,
            isNewestSelected
                ? Icons.check_circle_sharp
                : Icons.circle_outlined),
      ),
      Divider(),
      ListTile(
        title: Text("Price (Low to High)"),
        onTap: () {
          setState(() {
            isNewestSelected = false;
            isLowToHighSelected = true;
            isHighToLowSelected = false;
          });
          // Do something when Price (Low to High) is tapped
        },
        trailing: Icon(
            color: myMaterialColor,
            isLowToHighSelected
                ? Icons.check_circle_sharp
                : Icons.circle_outlined),
      ),
      Divider(),
      ListTile(
        title: Text("Price (High to Low)"),
        onTap: () {
          setState(() {
            isNewestSelected = false;
            isLowToHighSelected = false;
            isHighToLowSelected = true;
          });
          // Do something when Price (High to Low) is tapped
        },
        trailing: Icon(
            color: myMaterialColor,
            isHighToLowSelected
                ? Icons.check_circle_sharp
                : Icons.circle_outlined),
      )
    ]);
  }
}
