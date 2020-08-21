import 'package:flutter/material.dart';

import '../constants.dart';

class HeightSlider extends StatelessWidget {
  HeightSlider({this.colour, this.height, this.onChanged});

  final Color colour;
  int height = 180;
  final Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "HEIGHT",
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              height.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              "cm",
              style: kLabelTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor: kSliderInActiveColour,
            activeTrackColor: Colors.white,
            thumbColor: kBottomContainerColour,
            overlayColor: Color(0x2929EB155),
            //Color(0xFF29EB155) 29 satt FF 16% transparency
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          ),
          child: Slider(
            value: height.toDouble(),
            min: 120.00,
            max: 200.00,
            onChanged: (value) {
              onChanged(height = value.round().toInt());
            },
          ),
        )
      ],
    );
  }
}
