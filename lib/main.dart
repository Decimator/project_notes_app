import 'package:flutter/material.dart';
import 'package:untitled1/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days=30;
    String int1="aditya bhushan";
    return const MaterialApp(
      home: home_page(),
    );
  }
}

