import 'package:bmi_calculator_001/config/Shared.dart';
import 'package:bmi_calculator_001/config/appLocal.dart';
import 'package:bmi_calculator_001/constants.dart';
import 'package:bmi_calculator_001/screens/HomeScreen/HomeScreen.dart';
import 'package:bmi_calculator_001/screens/components/DefaultButton.dart';
import 'package:bmi_calculator_001/size_conf.dart';
import 'package:bmi_calculator_001/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This is the best practice

class IntroScreen extends StatelessWidget {
  static String routeName = "/IntroScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroContainer(),
    );
  }
}

class IntroContainer extends StatefulWidget {
  @override
  _IntroContainerState createState() => _IntroContainerState();
}

class _IntroContainerState extends State<IntroContainer> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "intro1", "sub": "sub1", "image": "assets/images/intro1.png"},
    {"text": "intro2", "sub": "", "image": "assets/images/intro2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    PageController _cont = PageController(initialPage: 0);

    return Container(
      // color: C,
      child: Stack(
        //fit: StackFit.passthrough,
        children: [
          PageView.builder(
            controller: _cont,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => Container(
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(100),
                  ),
                  Image.asset(splashData[index]['image']),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15)),
                    child: Text(
                      ((getLang(context, splashData[index]['text']) == null)
                          ? ""
                          : getLang(context, splashData[index]['text'])),
                      textAlign: TextAlign.center,
                      style: (currentPage == 0)
                          ? textTheme().headline2
                          : textTheme().bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(40)),
                    child: Text(
                      (getLang(context, splashData[index]['sub']) == null)
                          ? ""
                          : getLang(context, splashData[index]['sub']),
                      textAlign: TextAlign.center,
                      style: textTheme().caption,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(650)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                (currentPage != 1)
                    ?
                    // IconButton(
                    //     icon: Icon(Icons.arrow_forward, color: NPrimaryColor,
                    //       size: getProportionateScreenWidth(40),
                    //     ),
                    //     onPressed: () {
                    //       _Cont.nextPage(
                    //           duration: Duration(milliseconds: 500),
                    //           curve: Curves.fastOutSlowIn);
                    //     })
                    Container()
                    : Container(
                        width: getProportionateScreenWidth(250),
                        height: 55,
                        child: DefaultButton(
                            bordercolor: PrimaryColor,
                            backgroundcolor: PrimaryColor,
                            color: Colors.white,
                            text: getLang(context, 'start'),
                            textsize: 21,
                            bordersize: 0,
                            press: () async {
                              await addIntValue('intro', 1);
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.routeName);
                            }),
                      ),
                (currentPage == 0)
                    ? SizedBox(
                        height: getProportionateScreenHeight(63),
                      )
                    : SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                Text("MYHEART SERVICES 2021", style: textTheme().caption),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: DefaultDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          //fit: BoxFit.fill,
          height: getProportionateScreenHeight(750),
          //fit: BoxFit.cover,
        ),
      ],
    );
  }
}
