import 'package:flutter/material.dart';
import 'package:untitled1/utilities/routes.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.amber,
     child: SingleChildScrollView(
       child: Column(
         children: [
           Image.asset("assets/images/login_image1.png",fit:
           BoxFit.cover),
           const SizedBox(
             height: 20,
           ),
           const Text("WELCOME",style: TextStyle(
             fontSize: 40,
             fontWeight: FontWeight.bold,
           ),),

           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               children: [
                 TextFormField(
                   decoration: const InputDecoration(
                       hintText: "Enter Username",
                       labelText: "USERNAME"
                   ),
                 ),
                 TextFormField(
                   obscureText: true,
                   decoration: const InputDecoration(
                       hintText: "Enter Password",
                       labelText: "Password"
                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 ElevatedButton(onPressed: () {
                   Navigator.pushNamed(context, MyRoutes.homeRoute);
                 },

                   style: TextButton.styleFrom(minimumSize: const Size(120,40)),
                     child:const Text("Login"),
                   ),


               ],

             ),
           ),



         ],
       ),
     ),
    );
  }
}
