


import 'package:dalaalapp/Villo/home/widget/best_offer.dart';
import 'package:dalaalapp/Villo/home/widget/categories.dart';
import 'package:dalaalapp/Villo/home/widget/custom_app_bar.dart';
import 'package:dalaalapp/Villo/home/widget/recommended_house.dart';
import 'package:dalaalapp/Villo/home/widget/search_input.dart';
import 'package:dalaalapp/Villo/home/widget/welcome_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../addtocard/cart.dart';
import '../../loging.dart';
import '../../model/house.dart';
import '../../singup.dart';
import '../../userProfile.dart';

class VilloPage extends StatefulWidget {

  @override
  State<VilloPage> createState() => _VilloPageState();
}

class _VilloPageState extends State<VilloPage> {
  final recomendedVilloList = House.generatedvilloList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            SearchInput(),
            Categories(),
            RecommenderHouse(),
            BestOffer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff3a86ff),
          unselectedItemColor: Color(0xff3a86ff),
          items: [
            BottomNavigationBarItem(
              label: ('Home'),
              icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>VilloPage()));
                  },
                  child: Icon(Icons.home)),
            ),
            BottomNavigationBarItem(
              label: ('Info'),
              icon: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => RegistrationScreen()));
                  },
                  child: Icon(Icons.send)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          logout(context);
        },
        backgroundColor: Color(0xff3a86ff),
        child: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
      ),
    );
  }
  final _auth = FirebaseAuth.instance;
  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => LoginScreen()));
  }
}
