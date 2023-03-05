import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/bottom_navbar.dart';
import 'package:flutter_application_1/home_floating_button.dart';
import 'package:flutter_application_1/material_color.dart';
import 'package:flutter_application_1/sorting_listview.dart';

class WishListDormPage extends StatelessWidget {
  WishListDormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: HomeFloatingButton(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Favorites",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            IconButton(
                alignment: Alignment.bottomRight,
                onPressed: () {},
                icon: Icon(
                  Icons.manage_search_rounded,
                  color: Colors.grey[800],
                  size: 28,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "54 items",
                  style: TextStyle(
                      fontFamily: "Comfortaa",
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.indigo),
                ),
                IconButton(
                    alignment: Alignment.centerRight,
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
                    icon: Icon(
                      Icons.swap_vert,
                      color: Colors.indigo,
                      // size: 28,
                    )),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: (100 / 45),
              crossAxisCount: 1,
              shrinkWrap: true,
              children: [
                for (int i = 1; i < 10; i++)
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Divider(
                            height: 1,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/nobita.jpg"),
                                    radius: 15,
                                  )),
                              Text(
                                "name owner",
                                style: TextStyle(
                                    fontFamily: "Comfortaa",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              IconButton(
                                  alignment: Alignment.centerRight,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.grey,
                                    // size: 28,
                                  )),
                            ],
                          ),
                          Divider(height: 1),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 180,
                                  height: 120,
                                  child: Image.asset(
                                    "images/dorm_img/2.jpg",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // width: 10,
                                              // height: 5,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text("dorm name",
                                                  style: TextStyle(
                                                      fontFamily: "Comfortaa",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: null,
                                          height: 30,
                                        ),
                                        Container(
                                          width: 200,
                                          padding: EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "5000 BATH/MONTH",
                                                style: TextStyle(
                                                    fontFamily: "Comfortaa",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    // width: 10,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: myMaterialColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    18))),
                                                    child: const Text(
                                                      'Available',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Comfortaa",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 22,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
