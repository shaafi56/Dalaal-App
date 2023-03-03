

import 'package:dalaalapp/SplashScrn1.dart';
import 'package:dalaalapp/screen/home/home.dart';
import 'package:dalaalapp/screen/home/widget/Drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              backgroundColor: Color(0xFFF5F6F6),
              primaryColor: Color(0xff3a86ff),
              accentColor: Color(0XFFFA5019),
              textTheme: TextTheme(
                  headline1: TextStyle(
                    color: Color(0XFF100E34),
                  ),
                  bodyText1: TextStyle(
                    color: Color(0XFF100E34).withOpacity(0.3),
                  )
              )),
          home: Scaffold(
            body: SplashScreen1(),
          )));
}



