import 'package:flutter/material.dart';

class TakingDegrees extends StatefulWidget {
  final Function callBackFunction;
  final String appBarTitle;
  TakingDegrees(this.callBackFunction, this.appBarTitle, {super.key});

  @override
  State<TakingDegrees> createState() => _TakingDegreesState();
}

class _TakingDegreesState extends State<TakingDegrees> {
  final rootValue = List<String>.generate(200, (i) {
    if (i < 100)
      return "${i + 1}";
    else
      return "${99 - i}";
  });
  String? xNumbers;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            const Text("Choose Degrees of Xs"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: xNumbers,
                  items: rootValue.map(buildMenuItem).toList(),
                  onChanged: ((value) => setState(() {
                        xNumbers = value!;
                      })),
                ),
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   height: MediaQuery.of(context).size.height * 0.07,
            //   child: ElevatedButton(
            //       child: const Text("Next"),
            //       onPressed: () => widget.callBackFunction(context, xNumbers)),
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
                              widget.callBackFunction(context, xNumbers);
                            })),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
