import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalaalapp/model/house.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/user_model.dart';

class Orderpage extends StatefulWidget {
  final House house;
  const Orderpage({Key? key, required this.house}) : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {

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
    return Scaffold(
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Please feel free to contact us by phone or sms to hold your order!",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Image.asset(  "assets/images/contact1.png",),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3a86ff),
                    ),
                    onPressed: (){
                      launch('tel:+252612375858');
                    },child: Icon(Icons.call_end_outlined),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3a86ff),
                    ),
                    onPressed: (){
                      launch('sms:+252612375858?body= ${loggedUser.fullname} Ku Soo Dhawaaw Dalaal App Ma hubtaa in laguu haaynaayo  ${widget.house.name}  ku yaalo degmada ${widget.house.address}  gaar ahaan ${widget.house.SubAdress} qiimahiisana uu yahay  ${widget.house.lacag}, waxaan kugala soo xiriiraynaa Numberkan ${loggedUser.phone} sida uga dhaqsiyaha badan insha allah.'
                          '\nFG 24 hadii aad ka maqnaatid Dalabka Waa la kansali doonaa!');
                    },child: Icon(Icons.message),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        )
    );
  }
}
