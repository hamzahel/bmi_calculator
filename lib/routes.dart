import 'package:bmi_calculator_001/screens/HomeScreen/HomeScreen.dart';
import 'package:bmi_calculator_001/screens/ResultScreen.dart/AnimationResult.dart';
import 'package:bmi_calculator_001/screens/ResultScreen.dart/ResultScreen.dart';

import 'package:bmi_calculator_001/screens/SplashScreen/components/IntroScreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  ResultScreen.routeName: (context) => ResultScreen(),
  AnimationResult.routeName: (context) => AnimationResult(),
};
