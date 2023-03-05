import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/bottom_navbar.dart';

import 'package:flutter_application_1/filter_scrollable.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/custom_search.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_application_1/item_widget.dart';
import 'package:flutter_application_1/sorting_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Icon(Icons.holiday_village_rounded),
            Padding(padding: EdgeInsets.only(right: 15)),
            Text(
              "Room around KKU",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: FilterSelected()),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          "Properties",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 215,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Expanded(child: SortingListView())
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.swap_vert),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                ),
              ),
              const ItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
