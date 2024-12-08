import 'package:flutter/material.dart';
import 'package:secant/widgets/repeated_pages/entering_xs.dart';
import 'package:secant/widgets/repeated_pages/taking_degrees.dart';
import 'package:secant/home.dart';
import 'package:secant/widgets/repeated_pages/taking_limits.dart';

import 'showing_outputs.dart';

class NewtonMethod extends StatelessWidget {
  NewtonMethod({super.key});
  //Method Charactraistics
  String appBarTitle = "Newton Method";
  final inputType type = inputType.p;

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


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/widgets.dart';

// import 'entering_xs.dart';

// class NewtonMethod extends StatefulWidget {
//   const NewtonMethod({super.key});

//   @override
//   State<NewtonMethod> createState() => _NewtonMethodState();
// }

// class _NewtonMethodState extends State<NewtonMethod> {
//   final rootValue = List<String>.generate(100, (i) => "${i + 1}");

//   String? xNumbers;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Newton's Method")),
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
