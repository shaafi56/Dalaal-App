import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../snack_bar/open_snack_bar.dart';
import 'loging.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final RoundedLoadingButtonController forgetController =
  RoundedLoadingButtonController();
  TextEditingController emailController = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [Colors.blue, Colors.blue[200]!])),
      child: Scaffold(
        backgroundColor: Color(0xfffaab00),
        body: Stack(
          children: [
            Container(
              height: height * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.15),
              height: height * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.08),
                  Text(
                    'reset password'.toUpperCase(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                      height: 1,
                      width: width * 0.8,
                      color:  Color(0xfffaab00),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: TextField(
                      controller: emailController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter Correct Email * ",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.blue),
                          ),
                          filled: true,
                          fillColor:  Color(0xfffaab00).withOpacity(0.1),
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),

          RoundedLoadingButton(
            controller: forgetController,
            elevation: 0,
                color: Color(0xfffea904),
        onPressed: () {
          verifyPassword();
          emailController.clear();
        },
        successColor: Colors.green,
        width: MediaQuery.of(context).size.width * 0.40,
        borderRadius: 50,
        errorColor: Colors.red,
        child: Wrap(
          children: [
            Icon(
              FontAwesomeIcons.mailForward,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            Text(
                "Reset".toUpperCase(), textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future verifyPassword () async {
    Center(child: CircularProgressIndicator());
    try{
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      openSnackbar(context, "PassWord Reset Email Was Sent", Colors.green);
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LoginScreen()));
    }on FirebaseAuthException catch(e){
      print(e);
      openSnackbar(context, e.message, Colors.red);
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => ForgotPassword()));
    }
  }
}

