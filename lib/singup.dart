
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalaalapp/loging.dart';
import 'package:dalaalapp/snack_bar/open_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'model/user_model.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();
  //editing controller;
  final fullNameEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confrimPasswordEditingController = new TextEditingController();
  final RoundedLoadingButtonController SingUpController =
  RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    //full Name Fiedl;
    final fullNameField = TextFormField(
      autofocus: false,
      controller: fullNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty");
        }
        if (!regExp.hasMatch(value)) {
          return ("full must be 8 character at least");
        }
        return null;
      },
      onSaved: (value) {
        fullNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Full Name",hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    //phone Number Field;
    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{9,}$');
        if (value!.isEmpty) {
          return ("phone number cannot be empty");
        }
        if (!regExp.hasMatch(value)) {
          return ("phone must be 9 character at least");
        }
        return null;
      },
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "+25261xxxxxxx",hintStyle: TextStyle(color: Colors.white),
        labelText: "Phone Number",labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    //email Field;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_outline,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "example@gmail.com",hintStyle: TextStyle(color: Colors.white),
        labelText: "Email",labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    //password Field;
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
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
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_open,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    //confirmPassword Field;
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confrimPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confrimPasswordEditingController.text != passwordEditingController.text){
          return "password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confrimPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_open,color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm password",hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    final signupButton = RoundedLoadingButton(
      controller: SingUpController,
      elevation: 0,
      color: Color(0xff3a86ff),
      onPressed: () {
        signUp(emailEditingController.text, passwordEditingController.text);
      },
      successColor: Colors.green,
      width: MediaQuery.of(context).size.width * 0.80,
      borderRadius: 25,
      errorColor: Colors.red,
      child: Wrap(
        children: [
          Icon(
            FontAwesomeIcons.userCheck,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Text(
            "Save ", textAlign: TextAlign.center,
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
          physics: NeverScrollableScrollPhysics(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color:Color(0xff3a86ff),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    //logo;
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/images/regis5.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 15),
                    fullNameField,
                    SizedBox(height: 12),
                    phoneNumberField,
                    SizedBox(height: 12),
                    emailField,
                    SizedBox(height: 12),
                    passwordField,
                    SizedBox(height: 12),
                    confirmPasswordField,
                    SizedBox(height: 12),
                    signupButton,
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
        openSnackbar(context, e!.message, Colors.red);
      });
    }
  }
  postDetailsToFirestore() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writing all the values;
    userModel.email = user!.email;
    userModel.uid  = user.uid;
    userModel.fullname  = fullNameEditingController.text;
    userModel.phone = phoneNumberEditingController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    openSnackbar(context, "Account Created Successfully", Colors.green);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>LoginScreen()), (route) => false);

  }
}

