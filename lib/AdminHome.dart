import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/Reading_of_Demanding_Areas.dart';
import 'database/read2.dart';
import 'helppage.dart';
import 'housedetail.dart';
import 'loging.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}
class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 232,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: Image.asset(
                        "assets/images/house1.png"
                    ).image,
                  )
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: 200,),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>houseDetail()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/add1.png",height: 150,),
                              Text('insert available houses'.toUpperCase()),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (builder)=>InsertJobScreen()));
                        },
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>DemandinData()));
                          },
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/house5.png",height: 150,),
                                Text('High Demand Areas'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>HelpPage()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/Helping.png",height: 150,),
                              Text('Contact Us'.toUpperCase()),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          logout(context);
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/logout3.png",height: 120,),
                              SizedBox(height: 10),
                              Text('LOG OUT'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  final _auth = FirebaseAuth.instance;
  Future<void>  logout(BuildContext context) async{
    await   _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> LoginScreen()));
  }
}
