import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/screens/ResultScreen.dart/AnimationResult.dart';
import 'package:bmi_calculator_001/screens/components/DefaultButton.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(350),
      padding: EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RaduisValue + 5)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: TextColor.withOpacity(0.1),
            // boxShadow: [
            //   BoxShadow(spreadRadius: 3, blurRadius: 10, offset: Offset(0, -5)),
            // ],
            borderRadius: BorderRadius.circular(RaduisValue + 10)),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                    blurRadius: 1,
                    offset: Offset(0, 0)),
              ],
              gradient: PrimaryGradientColor,
              borderRadius: BorderRadius.circular(RaduisValue)),
          child: Consumer<ProviderManager>(builder: (context, value, child) {
            return DefaultButton(
              text: "Calculate",
              color: Colors.white,
              backgroundcolor: Colors.transparent,
              bordercolor: Colors.transparent,
              bordersize: 0,
              textsize: getProportionateScreenWidth(30),
              press: () {
                value.setBmi();
                Navigator.pushNamed(context, AnimationResult.routeName);
              },
            );
          }),
        ),
      ),
    );
  }
}
