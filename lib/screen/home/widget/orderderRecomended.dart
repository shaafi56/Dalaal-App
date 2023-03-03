import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';

class OrderedRecommended extends StatefulWidget {
  State<OrderedRecommended> createState() => _OrderedRecommendedState();
}

class _OrderedRecommendedState extends State<OrderedRecommended> {
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
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Image.asset(
                    item.imageUrl,
                  ),
                  title: Text(item.name),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          recomendedList.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}
