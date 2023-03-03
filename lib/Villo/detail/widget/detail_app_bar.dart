import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailAppBar extends StatelessWidget {
  final House house;
  const DetailAppBar({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Image.asset(
            house.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                ),

                 Icon(Icons.bookmark, color: Colors.white),
            ],
          ),
              ))
        ],
      ),
    );
  }
}
