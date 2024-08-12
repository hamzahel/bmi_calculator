import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/enum.dart';
import 'package:bmi_calculator_001/provider/provider.dart';
import 'package:bmi_calculator_001/screens/components/RadioButton.dart';
import 'package:bmi_calculator_001/screens/components/TextField.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElementBackGround extends StatelessWidget {
  final String title;
  final TextType textType;

  ElementBackGround({this.title, this.textType});

  final TextStyle titleStyle = TextStyle(
    fontSize: getProportionateScreenWidth(24),
    color: TextColor.withOpacity(0.8),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: getProportionateScreenHeight(140),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius:
              BorderRadius.circular(getProportionateScreenWidth(RaduisValue)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0.1, blurRadius: 10),
          ]),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          RowElement(
            type: textType,
          )
        ],
      ),
    );
  }
}

class RowElement extends StatefulWidget {
  final TextType type;

  RowElement({this.type});
  @override
  _RowElementState createState() => _RowElementState();
}

class _RowElementState extends State<RowElement> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderManager>(builder: (context, value, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        RadioButton(
            text: '-',
            color: TextColor,
            onPress: () {
              setState(() {
                if (widget.type == TextType.Age)
                  value.setAge(value.getAge - 1);
                else if (widget.type == TextType.Height)
                  value.setHeight(value.getHeight - 1);
                else if (widget.type == TextType.Weight)
                  value.setWeight(value.getWeight - 1);
              });
            }),
        TextFieldBuilder(
          inputType: widget.type,
          valueText: (widget.type == TextType.Age)
              ? value.getAge.toString()
              : ((widget.type == TextType.Height)
                  ? value.getHeight.toString()
                  : value.getWeight.toString()),
        ),
        RadioButton(
            text: '+',
            color: PrimaryColor,
            onPress: () {
              setState(() {
                if (widget.type == TextType.Age)
                  value.setAge(value.getAge + 1);
                else if (widget.type == TextType.Height)
                  value.setHeight(value.getHeight + 1);
                else if (widget.type == TextType.Weight)
                  value.setWeight(value.getWeight + 1);
              });
            }),
      ]);
    });
  }
}
