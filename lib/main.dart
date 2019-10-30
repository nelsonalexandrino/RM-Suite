import 'package:flutter/material.dart';

import './pages/rm_suite_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final suitecolor = MaterialColor(
    0xFF640032,
    const <int, Color>{
      50: const Color(0xFF640032),
      100: const Color(0xFF640032),
      200: const Color(0xFF640032),
      300: const Color(0xFF640032),
      400: const Color(0xFF640032),
      500: const Color(0xFF640032),
      600: const Color(0xFF640032),
      700: const Color(0xFF640032),
      800: const Color(0xFF640032),
      900: const Color(0xFF640032),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RM Suite',
      theme: ThemeData(
        primarySwatch: suitecolor,
      ),
      home: RMSuiteHomePage(),
    );
  }
}
