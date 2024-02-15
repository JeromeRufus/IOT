import 'package:demo/Screen/classification.dart';
import 'package:demo/Screen/control_pump.dart';
import 'package:flutter/material.dart';

class NavigatorButton extends StatefulWidget {
  const NavigatorButton({super.key});

  @override
  _NavigatorButtonState createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Plant Assistance",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              color: Color.fromARGB(255, 187, 226, 142),
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ControlPump.routeName),
                  child: Container(
                    width: 450,
                    height: 75.0,
                    // decoration: BoxDecoration(
                    //   //color: Color.fromARGB(255, 129, 187, 62),
                    //   border: Border.all(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Title(
                          color: Colors.black,
                          child: Text(
                            "Control Pump",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Turn ON/OFF",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              color: Color.fromARGB(255, 116, 164, 60),
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ImageAnalyze.routName),
                  child: Container(
                    width: 450,
                    height: 75.0,
                    // decoration: BoxDecoration(
                    //   //color: Color.fromARGB(255, 129, 187, 62),
                    //   border: Border.all(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(10.0),
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Title(
                          color: Colors.white,
                          child: Text(
                            "Health Check",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Take a photo of your plant",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
