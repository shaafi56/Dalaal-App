
import 'package:flutter/material.dart';

import '../../model/house.dart';
class dalab extends StatefulWidget {
  const dalab({Key? key}) : super(key: key);

  @override
  State<dalab> createState() => _dalabState();
}

class _dalabState extends State<dalab> {
  final recomendedList = House.generatedRecomended();
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ListView.builder(
                itemCount: recomendedList.length,
                itemBuilder: (context, index){
                  var item = recomendedList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: Card(
                      elevation: 4.0,
                      child: ListTile(
                        leading: Image.asset(
                          item.imageUrl,
                          color: Colors.white,
                        ),
                        title: Text(item.name),
                        trailing: GestureDetector(
                          child: (!recomendedList.contains(item))
                              ? Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          )
                              : Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              if (!recomendedList.contains(item))
                                recomendedList.add(item);
                              else
                                recomendedList.remove(item);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
