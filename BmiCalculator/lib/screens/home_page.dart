

/*
aita akta build in package jaita ami ai website thake use korsi ai khane
aro onk type er build in package ase:
https://pub.dev/packages/font_awesome_flutter

then,pubspec.yaml file a  cupertino_icons: ^1.0.2 er porer line a
  font_awesome_flutter: ^9.2.0 aita use korte hove.
*/



//Enum:
import 'package:bmicalculator/calcultaor_brain.dart';
import 'package:bmicalculator/components/button_Buttom.dart';
import 'package:bmicalculator/components/icon_content.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/constands.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
 
  Gender ?selectedGender;
  int height=180;
  int weight = 60;
  int age = 20;


  /*
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;

  void updateColor(Gender selectedGender)
  {
    if(selectedGender==Gender.male)
    {
      if(maleCardColor==inactiveCardColor)
      {
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }
      else 
      {
        maleCardColor=inactiveCardColor;
      }
    }
    if(selectedGender==Gender.female)
    {
      if(femaleCardColor==inactiveCardColor)
      {
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      }
      else 
      {
        femaleCardColor=inactiveCardColor;
      }
    }
  
    
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),centerTitle: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                    onPress: (){
                 setState(() {
                   selectedGender=Gender.male;
                   
                 });
                },
                  //Ternary operator:
                  colour: selectedGender==Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild:IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: (){
                   setState(() {
                     selectedGender=Gender.female;
                     
                   });
                  },
                  //here,we can togle the card by using the colure ternary operator condition;
                  colour: selectedGender==Gender.female ? kActiveCardColor:kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(

              colour:kActiveCardColor,
              cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [

                        Text(
                          height.toString(),
                        style: kNumberTextStyle,
                        ),
                        Text('cm',
                        style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(), 
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      
                      ),
                    ),
                  ],
              ), onPress: null,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,

                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                ), onPress: null,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour:kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                ), onPress: null,
                ),
              ),
            ],
          ),
          ButtomButton(
            bottomTitle: 'CALCULATE',
            onTab: (){
             
              CalcutorBrain calc=CalcutorBrain(height: height,weight: weight);
              
              
              Navigator.push(context,
               MaterialPageRoute(builder: (context)=>ResultPage(
                 bmiResult: calc.calculateBMI(),
                 resultText: calc.getResult(),
                 inerpretation: calc.getInterpretation(),
               ))
               );
            },
          ),
        ],
      ),
    );
  }
}




