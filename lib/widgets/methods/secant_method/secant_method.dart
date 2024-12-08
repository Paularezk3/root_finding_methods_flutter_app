import 'package:flutter/material.dart';
import 'package:secant/widgets/repeated_pages/entering_xs.dart';
import 'package:secant/widgets/repeated_pages/taking_degrees.dart';
import 'package:secant/home.dart';
import 'package:secant/widgets/repeated_pages/taking_limits.dart';

import 'showing_outputs.dart';

class SecantMethod extends StatelessWidget {
  SecantMethod({super.key});

  //Method Charactraistics
  String appBarTitle = "Secant Method Method";
  final inputType type = inputType.pp;

  //Important Variables
  late int xNumbers;

  callBackFunction1(BuildContext context, String xNumbers) {
    this.xNumbers = int.parse(xNumbers);
    this.xNumbers.isNegative ? this.xNumbers-- : this.xNumbers++;
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return EnteringXs(this.xNumbers, callBackFunction2, appBarTitle);
    }));
  }

  callBackFunction2(BuildContext context, List<double> LOI) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return TakingLimits(xNumbers, LOI, type, appBarTitle, callBackFunction3);
    }));
  }

  callBackFunction3(BuildContext context, List<double> LOI, int len) {
    try {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ShowingOutputs(xNumbers, LOI);
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TakingDegrees(callBackFunction1, appBarTitle);
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'entering_xs.dart';

// class FixedPoint extends StatefulWidget {
//   const FixedPoint({super.key});

//   @override
//   State<FixedPoint> createState() => _FixedPointState();
// }

// class _FixedPointState extends State<FixedPoint> {
//   final rootValue = List<String>.generate(100, (i) => "${i + 1}");

//   String? xNumbers;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Fixed Point Method")),
//         body: Padding(
//           padding: EdgeInsets.all(8),
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.width * 0.02,
//               ),
//               const Text("Choose Degrees of Xs"),
//               DropdownButton<String>(
//                 isExpanded: true,
//                 value: xNumbers,
//                 items: rootValue.map(buildMenuItem).toList(),
//                 onChanged: ((value) => setState(() {
//                       xNumbers = value;
//                     })),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 child: ElevatedButton(
//                   child: const Text("Next"),
//                   onPressed: () =>
//                       Navigator.push(context, MaterialPageRoute(builder: (_) {
//                     return (xNumbers != null
//                         ? EnteringXs(int.parse(xNumbers!) + 1)
//                         : EnteringXs(0));
//                   })),
//                 ),
//               )
//             ],
//           )),
//         ));
//   }

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       value: item,
//       child: Text(
//         item,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ));
// }


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'entering_xs.dart';

// class SecantMethod extends StatefulWidget {
//   const SecantMethod({super.key});

//   @override
//   State<SecantMethod> createState() => _SecantMethodState();
// }

// class _SecantMethodState extends State<SecantMethod> {
//   final rootValue = List<String>.generate(100, (i) => "${i + 1}");

//   String? xNumbers;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Secant Method")),
//         body: Padding(
//           padding: EdgeInsets.all(8),
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.width * 0.02,
//               ),
//               const Text("Choose Degrees of Xs"),
//               DropdownButton<String>(
//                 isExpanded: true,
//                 value: xNumbers,
//                 items: rootValue.map(buildMenuItem).toList(),
//                 onChanged: ((value) => setState(() {
//                       xNumbers = value;
//                     })),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 child: ElevatedButton(
//                   child: const Text("Next"),
//                   onPressed: () =>
//                       Navigator.push(context, MaterialPageRoute(builder: (_) {
//                     return (xNumbers != null
//                         ? EnteringXs(int.parse(xNumbers!) + 1)
//                         : EnteringXs(0));
//                   })),
//                 ),
//               )
//             ],
//           )),
//         ));
//   }

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       value: item,
//       child: Text(
//         item,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ));
// }
