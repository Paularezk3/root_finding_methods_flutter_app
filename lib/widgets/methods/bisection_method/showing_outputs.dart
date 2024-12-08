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
    List<Output> sol = MC.BisectionMethod(xNumbers, LOI);
    Widget itersText = Text("Number of iterations : ${sol.length}");
    return Scaffold(
      // appBar: AppBar(title: const Text("Bisection Answer")),
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
                    // if (sol[i].a == 0.0 && sol[i].b == 0) {
                    //   return Column(
                    //     children: [const Text("ERR : F(a) * F(b) > 0")],
                    //   );
                    //} else
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
                              width: MediaQuery.of(context).size.width * 0.05,
                              child: AutoSizeText(
                                "${i + 1} ",
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              child: AutoSizeText(
                                "a= ${sol[i].a.toStringAsFixed(6)}",
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              child: AutoSizeText(
                                  overflow: TextOverflow.fade,
                                  "b= ${sol[i].b.toStringAsFixed(6)}"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              child: AutoSizeText(
                                  overflow: TextOverflow.fade,
                                  "f(a)= ${sol[i].f0.toStringAsFixed(6)}"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              child: AutoSizeText(
                                  overflow: TextOverflow.fade,
                                  "f(b)= ${sol[i].f1.toStringAsFixed(6)}"),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            if (sol == 0) Center(child: Text("ERR : F(a) * F(b) > 0")),
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
