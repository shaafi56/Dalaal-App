
import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HouseInfo extends StatelessWidget {
  final House house;
  const HouseInfo({Key? key,required this.house }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              MenuInfo(icon: Icon(Icons.house_outlined), content: ' ${house.bedroom} \n ${house.whole}'),
              MenuInfo(icon: Icon(Icons.bathroom_outlined), content: '${house.bathroom}\n ${house.toilet}'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              MenuInfo(icon: Icon(Icons.kitchen), content: '${house.kitchen}'),
              MenuInfo(icon: Icon(Icons.car_rental_outlined), content: '${house.parking}'),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuInfo extends StatelessWidget {
  final Icon icon;
  final String content;
  const MenuInfo({Key? key, required this.icon,required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          children: [
            icon,
            SizedBox(height: 20),
            Text(content,style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }
}

