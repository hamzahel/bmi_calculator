import 'dart:ui';

import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/screens/components/DefaultButton.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;

  RadioButton({this.text, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(35),
      width: getProportionateScreenWidth(35),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValue),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 5),
        ],
      ),
      child: DefaultButton(
        text: text,
        color: color,
        textsize: getProportionateScreenHeight(24),
        backgroundcolor: Colors.transparent,
        bordercolor: Colors.transparent,
        bordersize: 0,
        press: onPress,
      ),
    );
  }
}
