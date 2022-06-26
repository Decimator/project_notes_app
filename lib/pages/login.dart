import 'package:flutter/material.dart';
import 'package:untitled1/utilities/routes.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String name="";
  bool changeButton= false;
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
            Text("WELCOME $name" ,style:const TextStyle(
             fontSize: 20,
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
                   onChanged:(value){
                     name=value;
                     setState((){});
                   },
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
                 InkWell(
                   onTap: () async {
                     setState((){
                       changeButton=true;
                     });
                     await Future.delayed(const Duration(seconds: 1));
                     Navigator.pushNamed(context, MyRoutes.homeRoute);
                   },
                   child: AnimatedContainer(
                     duration:  const Duration(seconds: 1),
                     width: changeButton?60 : 150,
                     decoration:  BoxDecoration(
                       color: Colors.purple,
                       borderRadius: BorderRadius.circular(10),
                     ),

                     height: 50,
                       //color: Colors.purple,
                     alignment: Alignment.center ,
                     child: changeButton?const Icon(Icons.done,color: Colors.white,): const Text("Login",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     ),) ,
                   ),
                 ),


                /* ElevatedButton(onPressed: () {
                   Navigator.pushNamed(context, MyRoutes.homeRoute);
                 },

                   style: TextButton.styleFrom(minimumSize: const Size(120,40)),
                     child:const Text("Login"),
                   ),*/


               ],

             ),
           ),



         ],
       ),
     ),
    );
  }
}
