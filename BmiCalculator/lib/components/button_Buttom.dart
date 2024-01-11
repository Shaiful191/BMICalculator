
import 'package:bmicalculator/constands.dart';
import 'package:flutter/material.dart';


class ButtomButton extends StatelessWidget {
  
  ButtomButton({required this.onTab, required this.bottomTitle});

  var onTab;
  final String bottomTitle;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTab,
      child: Container(
        child: Center(child: Text(bottomTitle,style: kLabelTextStyle,)),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContinerHight,
        color: Color(kBottomContainerColor),
      ),
    );
  }
}
