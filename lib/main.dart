import 'package:flutter/material.dart';
import 'package:mangal_graha/NavigationPage.dart';
import 'package:mangal_graha/homepage.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mangal Graha",
      home: NavigationPage(),
    );
  }
}
