import 'package:dalaalapp/model/house.dart';
import 'package:dalaalapp/Bacweyne//detail/widget/content_intro.dart';
import 'package:dalaalapp/Bacweyne/detail/widget/detail_app_bar.dart';
import 'package:dalaalapp/Bacweyne/detail/widget/house_info.dart';
import 'package:flutter/material.dart';
import '../../OrderPage.dart';
import 'about.dart';


class DetailPage extends StatefulWidget {
  final House house;

  const DetailPage({Key? key, required this.house}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(house: widget.house),
            SizedBox(height: 20),
            ContentIntro(house: widget.house),
            SizedBox(height: 20),
            HouseInfo(house: widget.house,),
            SizedBox(height: 20),
            AboutPage(),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>Orderpage(house:widget.house)));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Theme.of(context).primaryColor,
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
