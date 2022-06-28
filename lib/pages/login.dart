import 'package:flutter/material.dart';
import 'package:untitled1/controller/google_auth.dart';
//import 'package:untitled1/utilities/routes.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/cover.png",
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(12.0),
            child:  Text("Create and Manage your Notes!",
              style: TextStyle(
                fontSize: 36,
                fontFamily: "lato",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child:  ElevatedButton(onPressed:(){
              signInWithGoogle(context);
            },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[700]),
              ) , child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                 const Text("Continue with Google",
                     style: TextStyle(
                       fontSize: 18,
                       fontFamily: "lato",
                       //fontWeight: FontWeight.bold,
                     )

                 ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset("assets/images/google.png",
                  height: 32,
                ),

              ],
            ),

            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
