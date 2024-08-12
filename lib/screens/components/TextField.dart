import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/enum.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldBuilder extends StatelessWidget {
  final TextType inputType;
  final String valueText;

  TextFieldBuilder({this.inputType, this.valueText});

  //String value;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(builder: (context, value, child) {
      return Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RaduisValue + 5),
          color: TextColor.withOpacity(0.1),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.blue,
          //       spreadRadius: 0.09,
          //       blurRadius: 0.1,
          //       offset: Offset(3.5, 3.5)),
          // ],
          //gradient: InputGradientColor,

          // color: Colors.amber,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(RaduisValue),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 3.5,
                blurRadius: 0.9,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: TextEditingController(text: valueText),
            textAlign: TextAlign.center,
            maxLength: (inputType == TextType.Height) ? 3 : 2,
            // maxLengthEnforced: true,
            style: TextStyle(
                color: PrimaryColor, fontSize: getProportionateScreenWidth(21)),
            autofocus: false,
            autocorrect: false,
            showCursor: false,
            keyboardType: TextInputType.number,
            onChanged: (val) {
              switch (inputType) {
                case TextType.Age:
                  (int.parse(val) < 99)
                      ? value.setAge(int.parse(val))
                      : value.setAge(99);
                  break;
                case TextType.Height:
                  (int.parse(val) < 220)
                      ? value.setHeight(int.parse(val))
                      : value.setHeight(220);
                  break;
                case TextType.Weight:
                  (int.parse(val) < 120)
                      ? value.setWeight(int.parse(val))
                      : value.setWeight(120);
                  break;
              }
            },
            decoration: InputDecoration(
              counterText: '',
            ),
          ),
        ),
      );
    });
  }
}
