import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days=30;
    String int1="aditya bhushan";
    return  MaterialApp(
      title: "My Notes",
      home: login(),
      //themeMode: ThemeMode.light,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: const  Color(0xff070706),
      ),

      /*routes: {
        "/": (context)=>login(),
        MyRoutes.homeRoute:(context)=>home_page(),
        MyRoutes.loginRoute:(context)=>login(),*/



    );
  }
}

