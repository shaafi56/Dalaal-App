
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'image_upload/image_upload.dart';
// import 'package:mmjobs/image_upload/image_upload.dart';
// import 'package:mmjobs/screens/loging.dart';

class houseDetail extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  //form key
  final _formKey = GlobalKey<FormState>();
  final houe_type = new TextEditingController();
  final house_address = new TextEditingController();
  final house_subAdress = new TextEditingController();
  final house_kitchen = new TextEditingController();
  final number_of_parking = new TextEditingController();
  final number_of_bedroom = new TextEditingController();
  final number_of_bathroom = new TextEditingController();
  final number_of_toilet = new TextEditingController();
  final Size_of_house = new TextEditingController();


  CreateDB() async {
    try {
      firebase.collection('record_of_houses').doc(houe_type.text).set({
        "houe_type": houe_type.text,
        "house_address": house_address.text,
        "house_subAdress": house_subAdress.text,
        "house_kitchen": house_kitchen.text,
        "number_of_parking": number_of_parking.text,
        "number_of_bedroom": number_of_bedroom.text,
        "number_of_bathroom": number_of_bathroom.text,
        "number_of_toilet": number_of_toilet.text,
        "Size_of_house": Size_of_house.text,
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
          title: Text('Inserting House Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  //house type
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: houe_type,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("House Type cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("House Type must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'houe_type',
                        hintText: 'Guri villa ah',
                      ),
                    ),
                  ),
                  //house Address
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: house_address,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{8,}$');
                        if (value!.isEmpty) {
                          return ("House Address cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("House Address must be 8 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'House Address',
                        hintText: 'Enter Waaberi',
                      ),
                    ),
                  ),
                  //House SubAdress
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: house_subAdress,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("House SubAdress cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("House SubAdress must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'House SubAdress',
                        hintText: 'Waaberi_Maajo',
                      ),
                    ),
                  ),
                  //House kitchen
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: house_kitchen,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("House kitchen cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("House kitchen must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'House kitchen',
                        hintText: '2 Kitchen',
                      ),
                    ),
                  ),
                  //number_of_parking
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: number_of_parking,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("number_of_parking cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("number_of_parking must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number_of_parking',
                        hintText: '2 parking ',
                      ),
                    ),
                  ),
                  //number_of_bedroom
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: number_of_bedroom,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{5,}$');
                        if (value!.isEmpty) {
                          return ("number_of_bedroom cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("number_of_bedroom must be 5 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number_of_bedroom',
                        hintText: '5 bed rooms',
                      ),
                    ),
                  ),
                  //number_of_bathroom
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: number_of_bathroom,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("number_of_bathroom cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("number_of_bathroom must be 6 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number_of_bathroom',
                        hintText: '1 bathroom',
                      ),
                    ),
                  ),
                  //number_of_toilet
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: number_of_toilet,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("number_of_toilet cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("number_of_toilet must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number_of_toilet',
                        hintText: 'Enter 2 toilet',
                      ),
                    ),
                  ),
                  //Size_of_house
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: Size_of_house,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^.{4,}$');
                        if (value!.isEmpty) {
                          return ("Size_of_house cannot be empty");
                        }
                        if (!regExp.hasMatch(value)) {
                          return ("Size_of_house must be 4 character at least");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Size_of_house',
                        hintText: '12m × 13m',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ImageUpload()));
                      },
                      color: Color(0xff3a86ff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Upload Image of House", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                    ),
                  ),

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
                      child: Text("Insert", style: TextStyle(
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
