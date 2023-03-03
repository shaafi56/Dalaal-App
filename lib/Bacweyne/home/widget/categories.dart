import 'package:dalaalapp/housedetail.dart';
import 'package:dalaalapp/welcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Villo/home/home.dart';
import '../../../screen/home/home.dart';
import '../home.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoriesList = ['Guri Bacweyne ah', 'Guri Appartment ah', 'Guri Villa ah'];
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              setState(() {
                currentSelect = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: currentSelect == index?
                        Theme.of(context).primaryColor:
                        Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
                  child: GestureDetector(
                    child: Text(
                      categoriesList[index],
                      style: TextStyle(
                          color: currentSelect == index
                              ? Theme.of(context).primaryColor
                              :Colors.white,
                      fontSize: currentSelect== index? 16: 14,
                      fontWeight: currentSelect == index? FontWeight.bold: FontWeight.normal),
                    ),
                    onTap: (){
                      if (categoriesList[index]=="Guri Bacweyne ah"){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>BacweynePage()));
                      }else if(categoriesList[index]=="Guri Appartment ah"){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AppartMentPage()));
                      }else if(categoriesList[index]=="Guri Villa ah"){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>VilloPage()));
                        }
                    },
                  ),
                ),

          ),
          separatorBuilder: (_, index)=> SizedBox(
            width: 15,
          ),
          itemCount: categoriesList.length),
    );
  }
}
