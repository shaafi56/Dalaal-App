import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class MoneySend extends StatelessWidget {
  const MoneySend({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Donation Money Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  FlutterPhoneDirectCaller.callNumber('0615001974');
                },
                child: Text("Call phone ", style: TextStyle(fontSize: 40),),
              ),
              SizedBox(height: 30),
              MaterialButton(
                color: Colors.orangeAccent,
                onPressed: () {
                  launch("tel:*712*615001974*1_10#");
                },
                child: Text("💲1 dollar",style: TextStyle(fontSize: 40)),
              ),
            ],
          ),
        ),
    );
  }
}
