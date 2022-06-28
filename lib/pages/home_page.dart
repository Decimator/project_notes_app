import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/pages/addnote.dart';
import 'package:untitled1/pages/viewnote.dart';
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');
  List<Color> myColors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.deepPurple,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.tealAccent,
    Colors.pink,
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Notes",style:  TextStyle(fontSize: 32,fontFamily: "lato",
            fontWeight: FontWeight.bold),),
        elevation: 0.0,
        backgroundColor: const Color(0xff070706),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:() {
          Navigator.of(context).push(MaterialPageRoute(builder:
          (context)=>const AddNote()),
          ).then((value){
            print("calling set state!");
            setState((){});
          });
        } ,
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.add,color:
          Colors.white70,),


      ) ,
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get()  ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context,index){
                  Random random=new Random();
                  Color bg= myColors[random.nextInt(6)];
                  Map<String, dynamic>? data=snapshot.data?.docs[index].data();
                  DateTime mydateTime =data!['created'].toDate();
                  String formattedTime=DateFormat.yMMMd().add_jm().format(mydateTime);
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewNote(data,formattedTime,snapshot.data!.docs[index].reference),),
                      ).then((value){
                        setState((){});
                      });
                    },
                    child: Card(
                      color: bg,
                      child:Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data['title']}",style:const  TextStyle(fontSize: 24,fontFamily: "lato",
                                fontWeight: FontWeight.bold,color:Colors.black87 ),),
                            Container(
                              alignment: Alignment.centerRight,
                              child:  Text(formattedTime,
                                style: const TextStyle(fontSize: 12,fontFamily: "lato",
                                    fontWeight: FontWeight.bold),

                              ),
                            )
                          ],
                        ),
                      ) ,
                    ),
                  );
                });

          }else{
            return const Center(child: Text("Loading..."),);
          }
        },
      ),


    );
  }
}
