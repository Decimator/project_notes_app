import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/utilities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days=30;
    String int1="aditya bhushan";
    return  MaterialApp(
      //home: home_page(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch:Colors.purple
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark

      ) ,

      routes: {
        "/": (context)=>login(),
        MyRoutes.homeRoute:(context)=>home_page(),
        MyRoutes.loginRoute:(context)=>login(),


      },
    );
  }
}

