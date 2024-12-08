// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

enum inputType { ab, p, x, pp }

class Home extends StatelessWidget {
  List<String> methods = [
    "Bisection Method",
    "False Position Method",
    "Newton's Method",
    "Secant Method",
    "Fixed Point Method",
  ];

  Widget box(Color color, context, String e, bool isLargeScreen, bool lastOne) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => onMethodTap(e, context),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color),
            color: color.withAlpha(80)),
        height: isLargeScreen
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.13,
        width: isLargeScreen
            ? lastOne
                ? width * 0.92
                : width * 0.45
            : width * 0.8,
        child: Center(
            child: Text(e,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[800]))),
      ),
    );
  }

  Widget getMethods(BuildContext context) {
    List<Color> iconColors = [
      Color.fromRGBO(164, 215, 204, 1.0),
      Color.fromRGBO(10, 114, 187, 1.0),
      Color.fromRGBO(249, 150, 133, 1.0),
      Color.fromRGBO(157, 172, 255, 1.0),
      Color.fromRGBO(238, 27, 150, 0.6)
    ];
    iconColors.shuffle();
    bool isLargeScreen;
    if (MediaQuery.of(context).size.width > 600)
      isLargeScreen = true;
    else
      isLargeScreen = false;

    if (isLargeScreen)
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              box(iconColors[0], context, methods[0], isLargeScreen, false),
              box(iconColors[1], context, methods[1], isLargeScreen, false)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              box(iconColors[2], context, methods[2], isLargeScreen, false),
              box(iconColors[3], context, methods[3], isLargeScreen, false),
            ],
          ),
          box(iconColors[4], context, methods[4], isLargeScreen, true)
        ],
      );
    else
      return Column(children: [
        box(iconColors[0], context, methods[0], isLargeScreen, false),
        box(iconColors[1], context, methods[1], isLargeScreen, false),
        box(iconColors[2], context, methods[2], isLargeScreen, false),
        box(iconColors[3], context, methods[3], isLargeScreen, false),
        box(iconColors[4], context, methods[4], isLargeScreen, false)
      ]);
  }

  void onMethodTap(String e, BuildContext context) {
    if (e == methods[0])
      Navigator.of(context).pushNamed("bisectionMethod");
    else if (e == methods[1])
      Navigator.of(context).pushNamed("falsePosition");
    else if (e == methods[2])
      Navigator.of(context).pushNamed("newtonMethod");
    else if (e == methods[3])
      Navigator.of(context).pushNamed("secantMethod");
    else if (e == methods[4]) Navigator.of(context).pushNamed("fixedPoint");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Secant Methods Solver",
        //     style: TextStyle(fontWeight: FontWeight.w800),
        //   ),
        // ),
        backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Select Method",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
                ),
              ),
              getMethods(context)
            ],
          ),
        ));
  }
}
