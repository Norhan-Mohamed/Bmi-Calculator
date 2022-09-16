import 'package:bmi_calc/calculator.dart';
import 'package:bmi_calc/container.dart';
import 'package:flutter/material.dart';

import 'gender.dart';
import 'result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Gender? selectedGender;
double result = 0;
String interpretation = '';
BmiCalc bmi = BmiCalc();

class _HomePageState extends State<HomePage> {
  double heightValue = 181.0;
  int weightValue = 60;
  int ageValue = 20;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2136),
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1D2136),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Column(children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isMale ? Color(0xFF323244) : Color(0xff24263B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.male,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color:
                              !isMale ? Color(0xFF323244) : Color(0xff24263B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.female,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF323244),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "HEIGHT",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 24),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    heightValue.toInt().toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "cm",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              Slider(
                                value: heightValue,
                                min: 100,
                                max: 210,
                                thumbColor: Color(0xffE83D66),
                                activeColor: Color(0xffE83D66),
                                inactiveColor: Colors.grey,
                                onChanged: (newValue) {
                                  setState(() {
                                    heightValue = newValue;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: Row(
                children: [
                  Container_bottom(
                    label: "WEIGHT",
                    value: weightValue,
                    onMinusPressed: () {
                      setState(() {
                        weightValue--;
                      });
                    },
                    onPlusPressed: () {
                      setState(() {
                        weightValue++;
                      });
                    },
                  ),
                  Container_bottom(
                    label: "AGE",
                    value: ageValue,
                    onPlusPressed: () {
                      setState(() {
                        ageValue++;
                      });
                    },
                    onMinusPressed: () {
                      setState(() {
                        ageValue--;
                      });
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  result = bmi.calculator();
                  if (selectedGender != null) {
                    if (selectedGender == Gender.male) {
                      interpretation = bmi.maleInterpretation(result) as String;
                    } else if (selectedGender == Gender.female) {
                      interpretation =
                          bmi.femaleInterpretation(result) as String;
                    }
                  }
                });
                //  final double result = weightValue / pow(heightValue / 100, 2);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Result()));
              },
              child: Container(
                color: Color(0xffE83D66),
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Calculate".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                ),
              ),
            )
          ]))
        ],
      )),
    );
  }
}
