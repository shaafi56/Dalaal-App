import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  final recomendedList = House.generatedRecomended();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guriyaasha la dalbaday'),
      ),
      body: ListView.builder(
          itemCount: recomendedList.length,
          itemBuilder: (context, index) {
            var item = recomendedList[index];
            return Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                bottom: 8.0,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: (!recomendedList.contains(item))
                      ? Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  )
                      : Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                        recomendedList.add(item);
                    });
                  },
                ),
              ),
            );
          }),
    );
  }
}
