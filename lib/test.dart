import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.newspaper),
            label: 'Feed',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  // Page change using state does the same as clicking index 1 navigation button
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
