import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie/Screen/login.dart';
import 'Home.dart';


const label3 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  color: Colors.grey,
  fontSize: 15,
);

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color _color = Colors.white;
  Color _color1 = Colors.black;
  String email = '', pass = '';
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Book Movies'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _color = Colors.white;
                      _color1 = Colors.black;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      //borderRadius:
                      //const BorderRadius.all(Radius.circular(20)),
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2),
                      color: _color,
                    ),
                    child: const Text(
                      'Login',
                      style: label3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _color = Colors.black;
                      _color1 = Colors.white;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2),
                      color: _color1,
                    ),
                    child: const Text(
                      'Sign up',
                      style: label3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    width: 200,
                    child: Text(
                      'Create an Account',
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
                          fontSize: 15,
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
                        onChanged: (value) {
                          email = value;
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
                          fontSize: 15,
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
                        decoration:
                        InputDecoration(hintText: 'Enter Your Email'),
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
                      'Password',
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
                        obscureText: true,
                        onChanged: (value) {
                          pass = value;
                        },
                        decoration:
                        InputDecoration(hintText: 'Enter Your Password'),
                      ),
                    ),
                    Icon(
                      Icons.lock,
                      size: 30,
                      color: Colors.black,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree with',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    Text(
                      ' terms & condition',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      ' Sign in!',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: email, password: pass);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    //print('The password provided is too weak.');
                    Fluttertoast.showToast(msg: "The password provided is too weak",fontSize: 15,gravity: ToastGravity.CENTER);
                  } else if (e.code == 'email-already-in-use') {
                    //print('The account already exists for that email.');
                    Fluttertoast.showToast(msg: "The account already exists for that email",fontSize: 15,gravity: ToastGravity.CENTER);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}