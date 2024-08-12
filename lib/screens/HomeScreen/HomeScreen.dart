import 'package:bmi_calculator_001/screens/HomeScreen/components/HomeContainer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: HomeContainer(),
    );
  }
}
