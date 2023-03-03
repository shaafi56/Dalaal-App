import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalaalapp/snack_bar/open_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'loging.dart';

class Forgetpass extends StatefulWidget {
  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final RoundedLoadingButtonController LogingController =
      RoundedLoadingButtonController();

  final TextEditingController emailController = new TextEditingController();

  final firebase = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // we will give media query height;
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/forget1.png"))),
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter your email");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Enter Correct Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    RoundedLoadingButton(
                      controller: LogingController,
                      elevation: 0,
                      color: Color(0xff3a86ff),
                      onPressed: () {
                        verifyPassword();
                        emailController.clear();
                      },
                      successColor: Colors.green,
                      width: MediaQuery.of(context).size.width * 0.90,
                      borderRadius: 25,
                      errorColor: Colors.red,
                      child: Wrap(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Reset Password ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
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
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Forgetpass()));
    }
  }
}
