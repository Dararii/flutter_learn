import 'dart:math' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_learn/bmi_result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_constants.dart';
import 'bmi_icon_content.dart';
import 'bmi_reusable_card.dart';

enum Gender {
  male,
  female,
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InputPage();
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.male
                      ? kCardBackgroundColor
                      : kCardBackgroundInactiveColor,
                  child: MyIcon(
                    icon: FontAwesomeIcons.mars,
                    title: "MALE",
                  ),
                  onTap: () {
                    setState(
                      () {
                        selectedGender = Gender.male;
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kCardBackgroundColor
                      : kCardBackgroundInactiveColor,
                  child: MyIcon(
                    icon: FontAwesomeIcons.venus,
                    title: "FEMALE",
                  ),
                  onTap: () {
                    setState(
                      () {
                        selectedGender = Gender.female;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kCardBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kTextInputStyle,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 200,
                  activeColor: kContainerBackgroundColor,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.toInt();
                    });
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kCardBackgroundColor,
                  child: MyCustomInput(
                    title: "WEIGHT",
                    unit: "Kg",
                    number: weight,
                    fun1: () {
                      setState(() {
                        weight--;
                      });
                    },
                    fun2: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kCardBackgroundColor,
                  child: MyCustomInput(
                    title: "AGE",
                    unit: "y.o",
                    number: age,
                    fun1: () {
                      setState(() {
                        age--;
                      });
                    },
                    fun2: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            BMICalculatorBrain calc =
                BMICalculatorBrain(height: height, weight: weight);
            Navigator.pushNamed(
              context,
              "/bmi_result",
              arguments: ResultPage(
                bmiResult: calc.calculateBMI(),
                bmiResultText: calc.getResult(),
                bmiResultInterpretation: calc.getInterpretation(),
              ),
            );
          },
          child: Container(
            child: Center(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            padding: EdgeInsets.only(bottom: 8),
            width: double.infinity,
            height: kContainerHeight,
            color: kContainerBackgroundColor,
            margin: EdgeInsets.only(top: 10.0),
          ),
        )
      ],
    );
  }
}

class MyCustomInput extends StatelessWidget {
  const MyCustomInput(
      {Key key,
      @required this.title,
      @required this.number,
      @required this.unit,
      @required this.fun1,
      @required this.fun2})
      : super(key: key);

  final String title;
  final int number;
  final String unit;
  final Function fun1;
  final Function fun2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              number.toString(),
              style: kTextInputStyle,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              unit,
              style: kLabelTextStyle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyCustomRoundButton(
              icon: FontAwesomeIcons.minus,
              onPress: fun1,
            ),
            MyCustomRoundButton(
              icon: FontAwesomeIcons.plus,
              onPress: fun2,
            ),
          ],
        )
      ],
    );
  }
}

class MyCustomRoundButton extends StatelessWidget {
  MyCustomRoundButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4,
      disabledElevation: 4,
      child: Icon(
        icon,
        size: 24,
      ),
      fillColor: kContainerBackgroundColor,
      constraints: BoxConstraints(
        minWidth: 40,
        minHeight: 40,
      ),
      onPressed: onPress,
      shape: CircleBorder(),
    );
  }
}

class BMICalculatorBrain {
  BMICalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / prefix0.pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight";
    } else if (_bmi > 18.5)
      return "You have a normal body weight";
    else
      return "You have a lower than normal body weight";
  }
}
