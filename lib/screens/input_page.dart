import 'package:bmi_calculator/BmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'file:///C:/Users/ago/AndroidStudioProjects/flutter/bmi-calculator-flutter/lib/components/bottom_button.dart';
import 'file:///C:/Users/ago/AndroidStudioProjects/flutter/bmi-calculator-flutter/lib/components/num_edit_card.dart';
import 'file:///C:/Users/ago/AndroidStudioProjects/flutter/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'file:///C:/Users/ago/AndroidStudioProjects/flutter/bmi-calculator-flutter/lib/screens/results_page.dart';

import '../components/height_slider.dart';
import '../components/icon_content.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCart(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                          label: "MALE", iconData: FontAwesomeIcons.mars),
                      onTabFunc: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCart(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                          label: "FEMALE", iconData: FontAwesomeIcons.venus),
                      onTabFunc: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              )),
              Expanded(
                child: ReusableCart(
                  colour: kActiveCardColour,
                  cardChild: HeightSlider(
                    height: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCart(
                      colour: kActiveCardColour,
                      cardChild: NumEditCard(
                        label: "WEIGHT",
                        number: weight,
                        onTabPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onTabMinus: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCart(
                      colour: kActiveCardColour,
                      cardChild: NumEditCard(
                        label: "AGE",
                        number: age,
                        onTabPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                        onTabMinus: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
              BottomButton(
                buttonTitle: "CALCULATE",
                onTab: () {
                  BmiCalculator bmiCalc =
                      BmiCalculator(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: bmiCalc.calcBmi(),
                        resultText: bmiCalc.getResult(),
                        interpretation: bmiCalc.getInterpretation(),
                      ),
                    ),
                  );
                },
              )
            ]));
  }
}
