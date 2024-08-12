import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/components/loading.dart';
import 'package:bmi_calculator_001/screens/ResultScreen.dart/ResultScreen.dart';
import 'package:flutter/material.dart';

class AnimationResult extends StatefulWidget {
  static String routeName = "/AnimationResutl";
  @override
  _AnimationResultState createState() => _AnimationResultState();
}

class _AnimationResultState extends State<AnimationResult>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => ResultScreen()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: SecondaryColor),
      child: Container(
        child: new Scaffold(
          body: Container(
            width: double.infinity,
            // height: getProportionateScreenHeight(900),

            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Opacity(
                      opacity: opacity.value,
                      child: Loading(
                        fill: PrimaryColor,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
