import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/enum.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/screens/components/DefaultButton.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(builder: (context, value, child) {
      return Container(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(150),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0.1,
                        blurRadius: 10),
                  ],
                  gradient: (value.getGender == GenderType.female)
                      ? PrimaryGradientColor
                      : null,
                  borderRadius: BorderRadius.circular(RaduisValue)),
              child: DefaultButton(
                text: "Female",
                color: (value.getGender == GenderType.female)
                    ? Colors.white
                    : TextColor.withOpacity(0.8),
                backgroundcolor: Colors.transparent,
                bordercolor: Colors.transparent,
                bordersize: 0,
                textsize: getProportionateScreenWidth(24),
                press: () {
                  setState(() {
                    value.setGender(GenderType.female);
                  });
                },
              ),
            ),
            Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(150),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0.1,
                        blurRadius: 10),
                  ],
                  gradient: (value.getGender == GenderType.male)
                      ? PrimaryGradientColor
                      : null,
                  borderRadius: BorderRadius.circular(RaduisValue)),
              child: DefaultButton(
                text: "Male",
                color: (value.getGender == GenderType.male)
                    ? Colors.white
                    : TextColor.withOpacity(0.8),
                backgroundcolor: Colors.transparent,
                bordercolor: Colors.transparent,
                bordersize: 0,
                textsize: getProportionateScreenWidth(24),
                press: () {
                  setState(() {
                    value.setGender(GenderType.male);
                  });
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
