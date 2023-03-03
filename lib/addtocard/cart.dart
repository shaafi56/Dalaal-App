import 'package:dalaalapp/model/house.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  final List<House> recomendedList;
  Cart(this.recomendedList);
  @override
  _CartState createState() => _CartState(this.recomendedList);
}

class _CartState extends State<Cart> {
  _CartState(this.recomendedList);

  List<House> recomendedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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