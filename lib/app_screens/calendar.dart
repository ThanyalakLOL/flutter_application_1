import 'package:cr_calendar_example/pages/calendar_page.dart';
import 'package:cr_calendar_example/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter_application_1/material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Example app theme.
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.cyanAccent),
        primaryColor: Colors.cyanAccent,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.cyanAccent),
        iconTheme: const IconThemeData(color: Colors.cyanAccent),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              color: Colors.cyanAccent,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: Colors.cyanAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            shadowColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.cyanAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
      home: const CalendarPage(),
    );
  }
}
