import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewNote extends StatefulWidget {


  late final Map data;
  late final String time;
  late final DocumentReference ref;

  ViewNote(this.data,this.time,this.ref);




  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

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
                    ElevatedButton(onPressed:delete,
                        style:  ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red[300]),

                        ) , child: const
                      Icon(Icons.delete_forever),),
                  ],
                ),

              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(

                      "${widget.data['title']}",
                      style:const  TextStyle(fontSize: 32,fontFamily: "lato",
                          fontWeight: FontWeight.bold),
                      /*onChanged: (val){
                        title=val;
                      },*/
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top: 12,bottom: 8,),
                       child: Text(
                        widget.time,
                        style:const TextStyle(fontSize: 24,fontFamily: "lato",
                            ),
                        /*onChanged: (val){
                          title=val;
                        },*/
                    ),
                     ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      width: MediaQuery.of(context).size.width*1,
                      child: Text("${widget.data['description']}",
                        style:const  TextStyle(fontSize: 20,fontFamily: "lato",
                        ),
                        /*onChanged: (val){
                          des=val;
                        }*/
                        maxLines: 20,
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
  void delete() async {
    // delete from database
    await widget.ref.delete();


    Navigator.pop(context);
  }
}



