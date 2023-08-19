

import 'package:bmicalculator/components/button_Buttom.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constands.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {
  
  ResultPage({@required this.inerpretation,@required this.bmiResult,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String inerpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleTextStyle,),
            ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResuteTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        
                        inerpretation,
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                        ),
                    )
                    
                  ],
                ),
                ) ,
              ),
              ButtomButton(
                onTab: (){
                  Navigator.pop(context);
                },
                 bottomTitle: 'RE-CALCULATE',
                ),
        ],
      ),
    );
  }
}