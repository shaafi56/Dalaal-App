import 'package:dalaalapp/model/house.dart';
import 'package:dalaalapp/welcomeScreen.dart';
import 'package:dalaalapp/widget/circle_icon.dart';
import 'package:flutter/material.dart';
class BestOffer extends StatelessWidget {
  final listofbestvillo = House.generatedBestVillo();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brief Of Villo List ",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text("",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
            ],
          ),
          SizedBox(height: 10),
          ...listofbestvillo
              .map((el) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 150,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(el.imageUrl),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(el.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                SizedBox(height: 10),
                                Text(el.address,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                            child: CircleIconButton(
                          iconUrl: Icon(Icons.star),
                        ))
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
