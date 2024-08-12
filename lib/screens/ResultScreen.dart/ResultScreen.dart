import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/enum.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:bmi_calculator_001/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  static String routeName = 'ResultScreen';

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                      vertical: getProportionateScreenHeight(10)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenHeight(45),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(RaduisValue),
                        boxShadow: [
                          BoxShadow(
                              color: BackGround,
                              blurRadius: 2,
                              spreadRadius: 1.2),
                        ]),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back.svg',
                        width: getProportionateScreenWidth(25),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
              ),
              ResultContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultContainer extends StatelessWidget {
  final List items = [
    'assets/icons/overweight.svg',
    'assets/icons/normal.svg',
    'assets/icons/underweight.svg'
  ];

  final int bmi;
  ResultContainer({this.bmi});
  String getImage(Status status) {
    if (status == Status.Mild_Thinness ||
        status == Status.Moderate_Thinness ||
        status == Status.Severe_Thinness)
      return items[2];
    else if (status == Status.Obese_Class_I ||
        status == Status.Obese_Class_II ||
        status == Status.Obese_Class_III ||
        status == Status.Over_Weight)
      return items[0];
    else
      return items[1];
  }

  TextStyle getStyleFromStatus(Status status) {
    TextStyle style;

    if (status == Status.Mild_Thinness ||
        status == Status.Moderate_Thinness ||
        status == Status.Severe_Thinness)
      style = textTheme().headline2;
    else if (status == Status.Obese_Class_I ||
        status == Status.Obese_Class_II ||
        status == Status.Obese_Class_III ||
        status == Status.Over_Weight)
      style = textTheme().headline3;
    else
      style = textTheme().headline1;
    return style;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(builder: (context, value, child) {
      return Container(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(60)),
            SvgPicture.asset(getImage(value.getStatus)),
            SizedBox(height: getProportionateScreenHeight(80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your BMI is ", style: textTheme().bodyText1),
                Text(value.getBMI.toString().substring(0, 4),
                    style: getStyleFromStatus(value.getStatus))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your have a ", style: textTheme().bodyText1),
                Text(
                    value.getStatus
                            .toString()
                            .substring(
                                value.getStatus.toString().indexOf('.') + 1,
                                value.getStatus.toString().length)
                            .replaceAll('_', ' ') +
                        ' ',
                    style: getStyleFromStatus(value.getStatus)),
                // Text("Weigth", style: textTheme().bodyText1),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(120),
            ),
            Text("Healthy weight range for your height :",
                style: textTheme().caption),
            Text(
                "${value.getMinWeight.toString().substring(0, 4)} - ${value.getMaxWeight.toString().substring(0, 4)}",
                style: getStyleFromStatus(value.getStatus)),
          ],
        ),
      );
    });
  }
}

class ResultLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConf.screenHeight * 0.7,
      child: Center(
        child: Image.asset(
          'assets/images/launch_icon.png',
          width: getProportionateScreenWidth(150),
        ),
      ),
    );
  }
}
