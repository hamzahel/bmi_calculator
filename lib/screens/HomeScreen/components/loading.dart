import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  final Color fill;
  Loading({
    this.fill,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: getProportionateScreenWidth(320),
            height: getProportionateScreenWidth(250),
            child: LoadingIndicator(
              indicatorType: Indicator.ballScale,
              color: fill,
            )));
  }
}
