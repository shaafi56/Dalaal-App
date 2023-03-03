

import 'package:dalaalapp/screen/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Bacweyne/home/home.dart';
import '../../../Villo/home/home.dart';
import '../../../snack_bar/open_snack_bar.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController search = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: search,
        decoration: InputDecoration(
          errorText: _validate ? 'Search Textfield cann\'t Be Empty' : null,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)
          ),
          hintText: "Search here ....",
          prefixIcon: Container(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
                onTap: (){
                  setState(() {
                    if(search.text.isEmpty){
                      search.text.isEmpty ? _validate = true : _validate = false;
                    }else{
                      matchingMethod();
                    }
                  });
                },
                child: Icon(Icons.search)),
          ),
          contentPadding: EdgeInsets.all(2),
        ),
      ),
    );
  }

  void matchingMethod(){
    setState(() {
      if (search.text == "Bacweyne" || search.text == "jiingad" || search.text == "guri raqiis ah" || search.text =="weedow" || search.text == "bacweyne" || search.text == "Bacwayne") {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BacweynePage()),
        );
      } else if (search.text == "villo" || search.text == "guri villo" || search.text == "Villo" || search.text == "guri normal") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VilloPage()),
        );
      }else if(search.text == "apartment" || search.text == "Guri Dabaq " || search.text == "dabaq" || search.text == "guri dabaq" || search.text == "guri qaali"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppartMentPage()),
        );
      }else{
        openSnackbar(context, "Your Searching is not available ", Colors.red);
      }
    });
  }
}
