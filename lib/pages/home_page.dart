import 'package:flutter/material.dart';
class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRAZY BITCH"),
      ),
      body: Center(
        child: Container(
          child: const Text("WELCOME TO  FLUTTER"),

        ),
      ),

      drawer: const Drawer(),
    );
  }
}
