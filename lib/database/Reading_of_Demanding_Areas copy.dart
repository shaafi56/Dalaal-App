
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
class DemandinData extends StatefulWidget {
  const DemandinData({Key? key}) : super(key: key);

  @override
  State<DemandinData> createState() => _DemandinDataState();
}

class _DemandinDataState extends State<DemandinData> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Demand_Areas")
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
        body:  SingleChildScrollView(
          child: Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Demand_Areas').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                          children: snapshot.data!.docs.map((document) {
                            return Column(
                                children: [
                                  Text( "${document['fullname']}"),
                                  SizedBox(height: 10,),
                                  Text("${document['current_address']}"),
                                  SizedBox(height: 10,),
                                  Text(" ${document['Adress_of_searching']}"),
                                  SizedBox(height: 10,),
                                  Text("${document['Sub_Adress_of_searching']}"),
                                  SizedBox(height: 10,),
                                  Text("${document['house_type']}"),
                                ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
          ),
        ),
    );

  }
}

