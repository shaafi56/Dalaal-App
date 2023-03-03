
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'model/user_model.dart';


class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

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


  File? _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick!= null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              child: Row(
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
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, right: 10),
                        transform: Matrix4.rotationZ(100),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: _shareContent,
                          child: Icon(Icons.share))
                    ],
                  ),
                ],
              ),
            ),
              InkWell(
                onTap: getImage,
                child: CircleAvatar(
                  backgroundColor: Color(0xff3a86ff),
                  radius: 80.0,
                  child: CircleAvatar(
                    radius: 77.0,
                    child: ClipOval(
                      child: (_image != null)
                          ? Image.file(_image!)
                          : Image.asset('assets/images/blank-profile.png',width: 100,),

                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Text(
                "${loggedUser.fullname} ",
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Pacifico'.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3a86ff),
                ),
              ),
              Text(
                "role user",
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontSize: 20,
                  fontFamily: 'MavenPro',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25,
                width: 200,
                child: Divider(
                  color: Colors.black26,
                ),
              ),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.5),
                color: Color(0xff3a86ff),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  title: Text(
                    "${loggedUser.phone}",
                    style: TextStyle(
                      fontFamily: "MavenPro",
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.5),
                color: Color(0xff3a86ff),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  title: Text(
                    "${loggedUser.email}",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontFamily: 'MavenPro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  final String _content =
      'Wellcome To Dalaal  House Renting application.';
  void _shareContent() {
    Share.share(_content);
  }
}

