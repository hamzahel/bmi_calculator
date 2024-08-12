import 'package:bmi_calculator_001/size_conf.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.color,
    this.backgroundcolor,
    this.press,
    this.bordercolor,
    this.textsize,
    this.bordersize,
  }) : super(key: key);
  final String text;
  final Function press;
  final double textsize;
  final Color color;
  final Color backgroundcolor;
  final Color bordercolor;
  final double bordersize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: GestureDetector(
        onTap: press,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(30)),
              side: BorderSide(color: bordercolor, width: bordersize)),
          color: backgroundcolor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: textsize,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
