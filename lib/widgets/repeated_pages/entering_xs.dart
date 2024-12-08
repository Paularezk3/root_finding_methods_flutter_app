import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnteringXs extends StatefulWidget {
  final int xNumbers;
  final Function callBackFunction;
  final String appBarTitle;
  const EnteringXs(this.xNumbers, this.callBackFunction, this.appBarTitle,
      {super.key});

  @override
  State<EnteringXs> createState() => _EnteringXsState();
}

class _EnteringXsState extends State<EnteringXs> {
  final List<double> LOI = <double>[];
  final List<TextEditingController> LOC = <TextEditingController>[];

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
                  itemCount: widget.xNumbers.abs(),
                  itemBuilder: (context, i) {
                    if (LOI.length <= i) {
                      LOI.add(0);
                      LOC.add(TextEditingController());
                    }
                    //TextEditingController controller = TextEditingController();
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.02,
                          ),
                          widget.xNumbers.isNegative
                              ? i == 0
                                  ? Text("Coef. of X^($i)")
                                  : Text("Coef. of X^(-$i)")
                              : Text("Coef. of X^$i"),
                          TextField(
                              controller: LOC[i],
                              onChanged: (value) =>
                                  LOI[i] = double.parse(value),
                              decoration: const InputDecoration(
                                  hintText: "Enter A Number",
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp('[-.0-9\b]')),
                              ])
                        ]);
                  }),
            )),
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
                              widget.callBackFunction(context, LOI);
                            })),
                  ],
                ))
          ])),
    );
  }
}
