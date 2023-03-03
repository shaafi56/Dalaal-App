
import 'package:flutter/material.dart';
class CircleIconButton extends StatelessWidget {
  final Icon iconUrl;
  const CircleIconButton({Key? key, required this.iconUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: iconUrl,
    );
  }
}
