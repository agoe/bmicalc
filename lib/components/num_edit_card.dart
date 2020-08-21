import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumEditCard extends StatelessWidget {
  NumEditCard(
      {@required this.label,
      @required this.number,
      @required this.onTabPlus,
      @required this.onTabMinus});

  final String label;
  final int number;
  final Function onTabPlus;
  final Function onTabMinus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          number.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
                iconData: FontAwesomeIcons.minus,
                number: number,
                onTabFunc: onTabMinus),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
                iconData: FontAwesomeIcons.plus,
                number: number,
                onTabFunc: onTabPlus),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.iconData,
      @required this.number,
      @required this.onTabFunc});

  final Function onTabFunc;
  final IconData iconData;
  final int number;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onTabFunc,
      //disabledElevation: 6.0 , not necessary if onpressed ist da
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
