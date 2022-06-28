import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      /*appBar: AppBar(
        title: Text("aditya"),
        backgroundColor: Colors.red,
      ),*/

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(onPressed:(){
                      Navigator.of(context).pop();
                    },
                    style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[700]),

                    ) , child: const
                      Icon(Icons.arrow_back_ios_outlined),),
                    ElevatedButton(onPressed:add,
                      style:  ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[700]),

                      ) , child: const Text("save",
                        style: TextStyle(fontSize:18,fontFamily: "lato",
                          color: Colors.white,
                            ), )),
                  ],
                ),

              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration.collapsed(hintText:"Title" ,),
                      style:const  TextStyle(fontSize: 32,fontFamily: "lato",
                      fontWeight: FontWeight.bold),
                      onChanged: (val){
                        title=val;
                      },
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      //width: MediaQuery.of(context).size.width*1,
                      child: Padding(
                        padding: const EdgeInsets.only(top:12),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(hintText:"Note Description" ,),
                          style:const  TextStyle(fontSize: 20,fontFamily: "lato",
                              ),
                          onChanged: (val){
                            des=val;
                          },
                          maxLines: 20,
                        ),
                      ),

                    )
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    ));
  }
   void add() async {
    // save to db
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {
      'title': title,
      'description': des,
      'created': DateTime.now(),
    };

    ref.add(data);

    //

    Navigator.pop(context);
  }
}



    