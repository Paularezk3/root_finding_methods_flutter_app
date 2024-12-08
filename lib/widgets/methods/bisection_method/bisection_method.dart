import 'package:flutter/material.dart';
import 'package:secant/widgets/repeated_pages/entering_xs.dart';
import 'package:secant/widgets/repeated_pages/taking_degrees.dart';
import 'package:secant/home.dart';
import 'package:secant/widgets/repeated_pages/taking_limits.dart';

import 'showing_outputs.dart';

class BisectionMethod extends StatelessWidget {
  BisectionMethod({super.key});
  //Method Charactraistics
  String appBarTitle = "Bisection Method";
  final inputType type = inputType.ab;

  //Important Variables
  late int xNumbers;
  late List<double> LOI = <double>[];

  callBackFunction1(BuildContext context, String xNumbers) {
    this.xNumbers = int.parse(xNumbers);
    this.xNumbers.isNegative ? this.xNumbers-- : this.xNumbers++;
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return EnteringXs(this.xNumbers, callBackFunction2, appBarTitle);
    }));
  }

  callBackFunction2(BuildContext context, List<double> LOI) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return TakingLimits(
          this.xNumbers, LOI, type, appBarTitle, callBackFunction3);
    }));
  }

  callBackFunction3(BuildContext context, List<double> LOI, int len) {
    this.LOI = LOI;
    try {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ShowingOutputs(xNumbers, LOI);
      }));
    } catch (e) {
      print(e);
    }
  }

  callBackFunction4() {}

  @override
  Widget build(BuildContext context) {
    return TakingDegrees(callBackFunction1, appBarTitle);
  }
}
