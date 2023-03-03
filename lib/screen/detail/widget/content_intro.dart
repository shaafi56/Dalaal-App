import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';

class ContentIntro extends StatelessWidget {
  final House house;
  const ContentIntro({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(house.name,style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 10),
          Text(house.address,style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 16,
          )),
          SizedBox(height: 10),
          Text(house.cabir,style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 16,
          )),
          SizedBox(height: 5),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${house.lacag}',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: ' Per Month',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                ),
                )
          ]))
        ],
      ),
    );
  }
}
