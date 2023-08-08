import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardLayout extends StatefulWidget {
  const CardLayout({Key? key}) : super(key: key);

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final moviecontroller = TextEditingController();
  final ticketcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 420,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      width: 250,
                      child: Text(
                        'BOOK YOUR MOVIE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.grey,
                        width: 290,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: namecontroller,
                          decoration:
                              InputDecoration(hintText: 'Enter Your Name'),
                        ),
                      ),
                      Icon(
                        Icons.drive_file_rename_outline,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.grey,
                        width: 290,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: emailcontroller,
                          onChanged: (value) {
                            //email = value;
                          },
                          decoration:
                              InputDecoration(hintText: 'Enter Your Email'),
                        ),
                      ),
                      Icon(
                        Icons.mail,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Mobile No.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.grey,
                        width: 290,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: mobilecontroller,
                          decoration:
                              InputDecoration(hintText: 'Enter Your Mobile'),
                        ),
                      ),
                      Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'Movie Title',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.grey,
                        width: 290,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: moviecontroller,
                          onChanged: (value) {
                            //pass = value;
                          },
                          decoration:
                              InputDecoration(hintText: 'Enter Your Movie'),
                        ),
                      ),
                      Icon(
                        Icons.movie,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        'No. Of Ticket',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //color: Colors.grey,
                        width: 290,
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: ticketcontroller,
                          onChanged: (value) {
                            //pass = value;
                          },
                          decoration:
                              InputDecoration(hintText: 'Enter No. Of Ticket'),
                        ),
                      ),
                      Icon(
                        Icons.price_change,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        CollectionReference collRef=FirebaseFirestore.instance.collection('Booking');
                        collRef.add({
                          'Name':namecontroller.text,
                          'Email':emailcontroller.text,
                          'Mobile':mobilecontroller.text,
                          'Movie':moviecontroller.text,
                          'Ticket':ticketcontroller.text
                        });

                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: "Successfully Booked",fontSize: 15,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey,textColor:Colors.white);
                      },
                      child: Text('Book'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC62828),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
