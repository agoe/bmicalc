import 'package:flutter/material.dart';

class ReusableCart extends StatelessWidget {
  ReusableCart({@required this.colour, this.cardChild, this.onTabFunc});

  final Color colour;
  final Widget cardChild;
  final Function onTabFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabFunc,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour, //Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
