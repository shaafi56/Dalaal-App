

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/house.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
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
                        Image.asset(  "assets/images/Helping.png",),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          " Contact any Help you Need!",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0),
                        )
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
        launch('sms:+252612375858?body=Hi Welcome to Dalaal App ');
      },child: Icon(Icons.message),
    ),
    SizedBox(width: 20),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff3a86ff),
      ),
      onPressed: (){
        launch('mailto:aadanlucky1998@gmail.com?subject=This is Subject Title&body=This is Body of Email');
      },child: Icon(Icons.mail),
    ),
  ],
)
            ],
          ),
        )
    );
  }
}