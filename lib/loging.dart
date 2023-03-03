import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalaalapp/screen/home/home.dart';
import 'package:dalaalapp/snack_bar/open_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'AdminHome.dart';
import 'forgetpass.dart';
import 'forgetpassword.dart';
import 'singup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key;
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController LogingController =
      RoundedLoadingButtonController();


  //editing controller;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_outline,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    //password field;
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login!");
        }
        if (!regExp.hasMatch(value)) {
          return ("password must be 6 character at least");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_open,color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    final loginButton = RoundedLoadingButton(
      controller: LogingController,
      elevation: 0,
      color: Color(0xff3a86ff),
      onPressed: () {
        // signIn(emailController.text, passwordController.text);
        emailController.clear();
        passwordController.clear();

        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AdminHome()));
      },
      successColor: Colors.green,
      width: MediaQuery.of(context).size.width * 0.80,
      borderRadius: 25,
      errorColor: Colors.red,
      child: Wrap(
        children: [
          Icon(
            FontAwesomeIcons.userLock,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Text(
            "Login Login As an Admin ", textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //logo;
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/images/login2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" "),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             RegistrationScreen()));
                          },
                          child: Text(
                            "",
                            style: TextStyle(
                              color: Color(0xff3a86ff),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Forgetpass()));
                          },
                          child: Text(
                            "",
                            style: TextStyle(
                              color: Color(0xff3a86ff),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function;
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                // Fluttertoast.showToast(msg: "Login Successful"),
                openSnackbar(context, "Login Successful", Colors.green),
                _checkRole(),
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AdminHome())),
              })
          .catchError((e) {
        openSnackbar(context, e!.message, Colors.red);
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LoginScreen()));
        // Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  String role = 'user';

  void navigateNext(Widget route) {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      role = snap['role'];
    });
    if (role == 'user') {
      navigateNext(AdminHome());
    } else if (role == 'admin') {
      navigateNext(AdminHome());
    }
  }
}

