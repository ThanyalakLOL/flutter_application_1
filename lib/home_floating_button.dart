import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeFloatingButton extends StatefulWidget {
  const HomeFloatingButton({super.key});

  @override
  State<HomeFloatingButton> createState() => _HomeFloatingButtonState();
}

class _HomeFloatingButtonState extends State<HomeFloatingButton> {
  @override
  Widget build(BuildContext context) {
    bool clicked = false;
    return FloatingActionButton(
      backgroundColor: Colors.indigo,
      onPressed: () {
        setState(() {
          clicked = true;
        });
        //go back home page naja eiei);
        Navigator.pushNamed(context, '/');
      },
      tooltip: "Add one More Item",
      child: const Icon(Icons.home_filled),
    );
  }
}
