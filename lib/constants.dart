import 'package:flutter/material.dart';
import 'package:bmi_calculator_001/size_conf.dart';

const PrimaryColor = Color(0xFFED2240);
const PrimaryLightColor = Color(0xFFF3D5ED);
const BackGround = Color(0xFFEDEDEE);
const InputGradientColor = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.white,
      BackGround
    ],
    stops: [
      0.7,
      1,
    ]);
const PrimaryGradientColor = LinearGradient(
    // begin: Alignment.center,
    // end: Alignment.topCenter,
    colors: [PrimaryColor, SecondaryColor], stops: [0.1, 1]);
const SecondaryColor = Color(0xFFED1C6C);
const TextColor = Color(0xFF404243);
const DefaultDuration = Duration(milliseconds: 250);
const double RaduisValue = 30.0;
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: TextColor,
  fontFamily: "Poppins",
  height: 1.5,
);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: TextColor),
  );
}
