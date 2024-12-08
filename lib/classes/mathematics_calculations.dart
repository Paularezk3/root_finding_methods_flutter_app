import 'package:flutter/material.dart';
import 'package:secant/widgets/methods/fixed_point/fixed_point.dart';
import 'package:secant/widgets/methods/secant_method/secant_method.dart';
import 'dart:math';
// import 'package:calculess/calculess.dart';
import 'derivative.dart';
import 'output.dart';

abstract class MC {
  //static Map<double, double> BisectionMethod(int xNumbers, List<double> LOI) {
  static double posf(int length, double X, List<double> LOI) {
    double fsum = 0, equ = 0;
    for (int i = length; i > 0; i--) {
      equ = pow(X, i - 1) * LOI[i - 1];
      fsum = equ + fsum;
    }
    return fsum;
  }

  static double negf(int length, double X, List<double> LOI) {
    double fsum = 0, equ = 0;
    for (int i = length; i > 0; i--) {
      equ = pow(X, -i + 1) * LOI[i - 1];
      fsum = equ + fsum;
    }
    return fsum;
  }

  static double f(int length, double X, int xNumbers, List<double> LOI) {
    return xNumbers.isNegative ? negf(length, X, LOI) : posf(length, X, LOI);
  }

  static double g(int length, double X, int xNumbers, List<double> LOI) {
    return xNumbers.isNegative ? negG(length, X, LOI) : posG(length, X, LOI);
  }

  static double posG(int length, double X, List<double> LOI) {
    double fsum = 0, equ = 0;
    for (int i = length; i > 0; i--) {
      num para(x) => pow(x, i - 1);
      equ = Calc.deriv(X, para) * LOI[i - 1];
      fsum = equ + fsum;
    }
    return fsum;
  }

  static double negG(int length, double X, List<double> LOI) {
    double fsum = 0, equ = 0;
    for (int i = length; i > 0; i--) {
      num para(x) => pow(x, -i + 1);
      equ = Calc.deriv(X, para) * LOI[i - 1];
      fsum = equ + fsum;
    }
    return fsum;
  }

  static List<Output> BisectionMethod(int xNumbers, List<double> LOI) {
    List<Output> output = [];
    double a = LOI[xNumbers.abs()];
    double b = LOI[xNumbers.abs() + 1];
    double c;
    LOI = LOI.sublist(0, xNumbers.abs());

    double f0 = f(LOI.length, a, xNumbers, LOI);
    double f1 = f(LOI.length, b, xNumbers, LOI);
    double f2;

    if (f0 * f1 > 0.0) return [Output(0, 0, 0, 0)];

    do {
      c = (a + b) / 2;
      f2 = f(LOI.length, c, xNumbers, LOI);

      output.add(Output(a, b, f0, f1));
      if (f0 * f2 < 0.0) {
        b = c;
        f1 = f2;
      } else {
        a = c;
        f0 = f2;
      }
    } while (f2.abs() > 0.00001);

    return output;
  }

  static List<Output> FalsePosition(int xNumbers, List<double> LOI) {
    List<Output> output = [];
    double a = LOI[xNumbers.abs()];
    double b = LOI[xNumbers.abs() + 1];
    double c;
    LOI = LOI.sublist(0, xNumbers.abs());

    double f0 = f(LOI.length, a, xNumbers, LOI);
    double f1 = f(LOI.length, b, xNumbers, LOI);
    double f2;

    if (f0 * f1 > 0.0) return [Output(0, 0, 0, 0)];

    do {
      c = b - ((f1 * (b - a)) / (f1 - f0));
      f2 = f(LOI.length, c, xNumbers, LOI);

      output.add(Output(a, b, f0, f1));
      if (f0 * f2 < 0.0) {
        b = c;
        f1 = f2;
      } else {
        a = c;
        f0 = f2;
      }
    } while (f2.abs() > 0.00001);

    return output;
  }

  static List<Output> NewtonsMethod(int xNumbers, List<double> LOI) {
    List<Output> output = [];
    double p0 = LOI[xNumbers.abs()], p1;
    LOI = LOI.sublist(0, xNumbers.abs());

    double f0, f1, g0;

    do {
      f0 = f(LOI.length, p0, xNumbers, LOI);
      g0 = g(LOI.length, p0, xNumbers, LOI);
      if (g0 == 0.0) return output;

      output.add(Output.newton(p0, f0, g0));
      p1 = p0 - f0 / g0;
      p0 = p1;
      f1 = f(LOI.length, p1, xNumbers, LOI);
    } while (f1.abs() > 0.00001);

    return output;
  }

  static List<Output> SecantMethod(int xNumbers, List<double> LOI) {
    List<Output> output = [];
    double a = LOI[xNumbers.abs()];
    double b = LOI[xNumbers.abs() + 1];
    double c;
    LOI = LOI.sublist(0, xNumbers.abs());

    double f0, f1, f2;
    f0 = f(LOI.length, a, xNumbers, LOI);
    f1 = f(LOI.length, b, xNumbers, LOI);

    do {
      if (f0 == f1) return output;
      output.add(Output(a, b, f0, f1));
      c = b - ((f1 * (b - a)) / (f1 - f0));
      f2 = f(LOI.length, c, xNumbers, LOI);

      a = b;
      f0 = f1;
      b = c;
      f1 = f2;
    } while (f2.abs() > 0.00001);

    return output;
  }

  static List<Output> FixedPoint(int xNumbers, List<double> LOI) {
    List<Output> output = [];
    double a = LOI[xNumbers.abs()];
    double b;
    LOI = LOI.sublist(0, xNumbers.abs());

    do {
      b = f(LOI.length, a, xNumbers, LOI);
      output.add(Output.fixed(a, b));
      if (b == double.infinity)
        return [Output.fixed(double.infinity, double.infinity)];
      if (b == double.negativeInfinity)
        return [Output.fixed(double.negativeInfinity, double.negativeInfinity)];
      a = b;
    } while (b.abs() > 0.00001);

    return output;
  }
}
