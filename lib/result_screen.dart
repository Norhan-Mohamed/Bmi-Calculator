import 'package:flutter/material.dart';

import 'calculator.dart';
import 'home.dart';

class Result extends StatefulWidget {
  Result({
    Key? key,
  }) : super(key: key);
  @override
  State<Result> createState() => _ResultState(result);
}

class _ResultState extends State<Result> {
  late bmiResult bmi_result;
  bool isPressed = false;
  BmiCalc bmi = BmiCalc();
  final double result;

  _ResultState(this.result, {Key? key}) {
    bmi_result = bmiResult(result: '', state: '', statement: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your Result",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            bmi_result.state.toUpperCase(),
                            style: TextStyle(
                                color: result > 24.9 || result < 18.5
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmi_result.result.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            bmi_result.statement,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Color(0xffE83D66),
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Re-Calculate".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 38),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
