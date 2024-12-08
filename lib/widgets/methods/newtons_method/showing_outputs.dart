// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:secant/classes/mathematics_calculations.dart';
import 'package:secant/classes/output.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ShowingOutputs extends StatelessWidget {
  final int xNumbers;
  final List<double> LOI;
  ShowingOutputs(this.xNumbers, this.LOI, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Output> sol = MC.NewtonsMethod(xNumbers, LOI);
    Widget itersText = Text("Number of iterations : ${sol.length}");
    return Scaffold(
      // appBar: AppBar(title: const Text("Newton's Method Answer")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            if (sol.length != 0) itersText,
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.98,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sol.length,
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.053,
                              child: AutoSizeText(
                                "${i + 1} ",
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.293,
                              child: AutoSizeText(
                                "p₀= ${sol[i].p0.toStringAsFixed(6)}",
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.293,
                              child: AutoSizeText(
                                  overflow: TextOverflow.fade,
                                  "f(p₀)= ${sol[i].f0.toStringAsFixed(6)}"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.293,
                              child: AutoSizeText(
                                  overflow: TextOverflow.fade,
                                  "g(p₀)= ${sol[i].g0.toStringAsFixed(6)}"),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            if (sol.length == 0) Center(child: Text("ERR : F(a) * F(b) > 0")),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                      child: const Text("Done"),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      })),
            )
          ],
        ),
      )),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../classes/mathematics_calculations.dart';

// class ShowingOutputs extends StatelessWidget {
//   final int xNumbers;
//   final List<double> LOI;
//   ShowingOutputs(this.xNumbers, this.LOI, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     String answer = "";
//     var a;
//     Map<double, double> sol = MC.NewtonsMethod(xNumbers, LOI);
//     a = sol.entries.toList()[0].key;
//     if (a == 0.0 || a == "NAN") {
//       answer = "ERR : F(a) * F(b) > 0";
//     } else {
//       answer = "p final = $a";
//     }
//     return Scaffold(
//       appBar: AppBar(title: Text("Newton's Answer")),
//       body: Center(
//         child: SingleChildScrollView(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(answer),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Container(
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   height: MediaQuery.of(context).size.height * 0.07,
//                   child: ElevatedButton(
//                       child: const Text("Done"),
//                       onPressed: () {
//                         Navigator.of(context)
//                             .popUntil((route) => route.isFirst);
//                       })),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
