import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/components/Element.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/components/Calculate.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/components/Gender.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_001/enum.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    return SafeArea(
      child: ListView(primary: true, shrinkWrap: true, children: [
        Container(
          alignment: Alignment.topCenter,
          height: SizeConf.screenHeight * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(RaduisValue + 10),
                bottomRight: Radius.circular(RaduisValue + 10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, spreadRadius: 0.1, blurRadius: 10),
            ],
          ),
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                color: TextColor.withOpacity(0.8),
                fontWeight: FontWeight.w500),
          ),
        ),
        //body
        Container(
          height: SizeConf.screenHeight * 0.9,
          child: Column(
            children: [
              //gender input
              Gender(),
              //Age input
              ElementBackGround(
                title: 'Age',
                textType: TextType.Age,
              ),
              //height input
              ElementBackGround(
                title: 'Height',
                textType: TextType.Height,
              ),
              //weight
              ElementBackGround(
                title: 'Weight',
                textType: TextType.Weight,
              ),
              // SizedBox(
              //   height: getProportionateScreenHeight(20),
              // ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Calculate(),
            ],
          ),
        ),
      ]),
    );
  }
}
