import 'package:flutter/material.dart';
import 'package:flutter_learn/bmi_constants.dart';
import 'package:flutter_learn/bmi_reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiResultInterpretation;

  const ResultPage(
      {Key key,
      @required this.bmiResult,
      @required this.bmiResultText,
      @required this.bmiResultInterpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultPage args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Your Result",
                  style: kTextInputStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kCardBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText == null ? args.bmiResultText : bmiResultText,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.green[300],
                    ),
                  ),
                  Text(
                    bmiResult == null ? args.bmiResult : bmiResult,
                    style: TextStyle(fontSize: 100),
                  ),
                  Text(
                    bmiResultInterpretation == null
                        ? args.bmiResultInterpretation
                        : bmiResultInterpretation,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
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
          ),
        ],
      ),
    );
  }
}
