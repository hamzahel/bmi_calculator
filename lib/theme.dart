import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: PrimaryColor,
    ),
    // for others(Android, Fuchsia)
    // ignore: deprecated_member_use
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue,
      //selectionColor: NPrimaryColor,
      //selectionHandleColor: NPrimaryColor,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius:
        BorderRadius.circular(getProportionateScreenWidth(RaduisValue - 10)),
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  );
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    hintStyle: TextStyle(
        color: Colors.black26, fontSize: getProportionateScreenWidth(17)),
    errorStyle: TextStyle(
      height: 1,
    ),
    labelStyle: TextStyle(
      height: 1,
      fontSize: getProportionateScreenWidth(14),
      color: Colors.black38,
    ),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    enabledBorder: borderStyle,
    focusedBorder: borderStyle,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(
        color: TextColor.withOpacity(0.8),
        fontSize: getProportionateScreenWidth(18),
        fontWeight: FontWeight.w300),
    bodyText2: TextStyle(
        color: Colors.green[200], fontSize: getProportionateScreenWidth(21)),
    headline1: TextStyle(
        color: Colors.green[200], fontSize: getProportionateScreenWidth(21)),
    headline2: TextStyle(
        color: PrimaryColor, fontSize: getProportionateScreenWidth(21)),
    headline3: TextStyle(
        color: Color(0xFFFF05FA), fontSize: getProportionateScreenWidth(21)),
    caption: TextStyle(
        height: getProportionateScreenHeight(1.4),
        color: TextColor.withOpacity(0.7),
        fontSize: getProportionateScreenWidth(16)),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(color: PrimaryColor, fontSize: 18),
    ),
  );
}
