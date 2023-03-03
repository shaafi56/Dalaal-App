
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'image_upload/image_upload.dart';
// import 'package:mmjobs/image_upload/image_upload.dart';
// import 'package:mmjobs/screens/loging.dart';

class DemanAreas extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  //form key
  final _formKey = GlobalKey<FormState>();
  final fullname = new TextEditingController();
  final tell_phone = new TextEditingController();
  final current_address = new TextEditingController();
  final Adress_of_searching = new TextEditingController();
  final Sub_Adress_of_searching = new TextEditingController();
  final house_type = new TextEditingController();



  CreateDB() async {
    try {
      firebase.collection('Demand_Areas').doc(fullname.text).set({
        "fullname": fullname.text,
        "tell_phone": tell_phone.text,
        "current_address": current_address.text,
        "Adress_of_searching": Adress_of_searching.text,
        "Sub_Adress_of_searching": Sub_Adress_of_searching.text,
        "house_type": house_type.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3a86ff),
          title: Text('order your favorite '.toUpperCase()),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  //full name
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: fullname,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{8,}$');
                        if (value!.isEmpty) {
                          return ("Full name cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Full name must be 8 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                        hintText: 'Enter Your Full Name',
                      ),
                    ),
                  ),
                  //tell_phone
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: tell_phone,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{12,}$');
                        if (value!.isEmpty) {
                          return ("Tell phone cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Tell phone must be 12 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Phone Number',
                        hintText: '+25261xxxxxxx',
                      ),
                    ),
                  ),
                  //current_address
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: current_address,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{5,}$');
                        if (value!.isEmpty) {
                          return ("current_address cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("current_address must be 5 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your current Address',
                        hintText: 'waaberi',
                      ),
                    ),
                  ),
                  //Adress_of_searching
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: Adress_of_searching,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{5,}$');
                        if (value!.isEmpty) {
                          return ("Adress_of_searching cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Adress_of_searching must be 5 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adress_of_searching',
                        hintText: 'Madiino',
                      ),
                    ),
                  ),
                  //Sub_Adress_of_searching
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: Sub_Adress_of_searching,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{5,}$');
                        if (value!.isEmpty) {
                          return ("Sub_Adress_of_searching cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Sub_Adress_of_searching must be 5 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number_of_parking',
                        hintText: 'Dabaqeyn',
                      ),
                    ),
                  ),
                  //house_type
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: house_type,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{5,}$');
                        if (value!.isEmpty) {
                          return ("house_type cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("house_type must be 5 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter House Type',
                        hintText: 'Guri bacweyne',
                      ),
                    ),
                  ),
                  //number_of_bathroom

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        CreateDB();
                      },
                      color: Color(0xff3a86ff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Send".toUpperCase(), style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
