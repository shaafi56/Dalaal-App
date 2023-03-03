import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/user_model.dart';

class WelcomeText extends StatefulWidget {
  @override
  State<WelcomeText> createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${loggedUser.fullname}".toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
          SizedBox(height: 10),
          Text("Find Your Favorite Home", style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
        ],
      ),
    );
  }
}
