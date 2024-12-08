// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secant/home.dart';

class TakingLimits extends StatefulWidget {
  final inputType _type;
  final int xNumbers;
  List<double> LOI;
  String appBarTitle;
  Function callBackFunction;
  TakingLimits(this.xNumbers, this.LOI, this._type, this.appBarTitle,
      this.callBackFunction,
      {super.key});

  @override
  State<TakingLimits> createState() => _TakingLimitsState();
}

class _TakingLimitsState extends State<TakingLimits> {
  List<TextEditingController> LOC = <TextEditingController>[];

  int len() {
    return widget._type == inputType.ab
        ? 2
        : widget._type == inputType.x
            ? 1
            : widget._type == inputType.p
                ? 1
                : 2;
  }

  String textHeader(int i) {
    if (i == 0)
      return widget._type == inputType.ab
          ? "a"
          : widget._type == inputType.x
              ? "X₀"
              : "p₀";
    else if (i == 1) return widget._type == inputType.ab ? "b" : "p₁";
    return "x";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    AppBar.preferredHeightFor(context, const Size(2, 56)),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: len(),
                    itemBuilder: (context, i) {
                      if (widget.LOI.length <= i + widget.xNumbers.abs()) {
                        widget.LOI.add(0);
                        LOC.add(TextEditingController());
                      }
                      if (LOC.length <= i) LOC.add(TextEditingController());
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text("Enter Value Of ${textHeader(i)}"),
                            TextField(
                                controller: LOC[i], //controller
                                onChanged: (value) => widget.LOI.insert(
                                    i + widget.xNumbers.abs(),
                                    double.parse(value)),
                                decoration: const InputDecoration(
                                    hintText: "Enter A Number",
                                    border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[.0-9]')),
                                ])
                          ]);
                    })),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Container(
          //       width: MediaQuery.of(context).size.width * 0.8,
          //       height: MediaQuery.of(context).size.height * 0.07,
          //       child: ElevatedButton(
          //           child: const Text("Next"),
          //           onPressed: () {
          //             widget.callBackFunction(
          //                 context,
          //                 widget.LOI.sublist(0, widget.xNumbers.abs() + len()),
          //                 len());
          //           })),
          // )
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height > 250
                          ? MediaQuery.of(context).size.height * 0.07
                          : 20,
                      child: ElevatedButton(
                          child: const Text("Back",
                              style: TextStyle(color: Colors.blue)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            side: BorderSide(color: Colors.blue, width: 1.2),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height > 250
                          ? MediaQuery.of(context).size.height * 0.07
                          : 20,
                      child: ElevatedButton(
                          child: const Text("Next"),
                          onPressed: () {
                            widget.callBackFunction(
                                context,
                                widget.LOI
                                    .sublist(0, widget.xNumbers.abs() + len()),
                                len());
                          })),
                ],
              ))
        ]),
      ),
    );
  }
}
