import 'package:flutter/material.dart';
import 'package:secant/widgets/methods/false_position/falsePosition.dart';
import 'package:secant/widgets/methods/newtons_method/newton_method.dart';
import 'package:secant/widgets/methods/fixed_point/fixed_point.dart';
import 'package:secant/widgets/methods/secant_method/secant_method.dart';

import 'home.dart';
import 'widgets/methods/bisection_method/bisection_method.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secant Methods',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(color: Color.fromRGBO(41, 47, 54, 1.0)),
        // backgroundColor: Color.fromRGBO(219, 219, 219, 1.0),
        // buttonColor: Colors.white,
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        "bisectionMethod": (_) => BisectionMethod(),
        "falsePosition": (_) => FalsePosition(),
        "newtonMethod": (_) => NewtonMethod(),
        "fixedPoint": (_) => FixedPoint(),
        "secantMethod": (_) => SecantMethod(),
      },
    );
  }
}
