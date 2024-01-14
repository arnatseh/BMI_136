  import 'dart:math';
  import 'package:flutter/material.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:test_136/page/widget/container_box.dart';
  import 'package:test_136/page/widget/data_container.dart';
  import 'package:test_136/page/result_bmi.dart';

  const activeColor = Color.fromARGB(255, 80, 185, 204);
  const inActiveColor = Color.fromARGB(255, 5, 5, 5);

  class InputBmi extends StatefulWidget {
    const InputBmi({super.key});

    @override
    State<InputBmi> createState() => _InputBmiState();
  }

  class _InputBmiState extends State<InputBmi> {
    Color maleBoxColor = activeColor;
    Color femaleBoxColor = inActiveColor;
    int height = 170;
    int weight = 60;
    int age = 18;
    String result = "";
    String resultDetail = "Result here";
    double bmi = 0;

    void updateBoxColor(int gender) {
      if (gender == 1) {
        if (maleBoxColor == inActiveColor) {
          maleBoxColor = activeColor;
          femaleBoxColor = inActiveColor;
        } else {
          maleBoxColor = inActiveColor;
          femaleBoxColor = activeColor;
        }
      } else {
        if (femaleBoxColor == inActiveColor) {
          femaleBoxColor = activeColor;
          maleBoxColor = inActiveColor;
        } else {
          femaleBoxColor = inActiveColor;
          maleBoxColor = activeColor;
        }
      }
    }

    String calculateBmi(int weight, int height) {
      double bmi = weight / pow(height / 100, 2);
      return bmi.toStringAsFixed(1);
    }

    String getInterpretation(double bmi) {
      if (bmi < 18.5) {
        return 'น้ำหนักต่ำกว่าเกณฑ์';
      } else if (bmi >= 18.5 && bmi < 22.90) {
        return 'น้ำหนักปกติสมส่วน';
      } else if (bmi >= 23 && bmi < 24.90) {
        return 'น้ำหนักเกิน';
      } else if (bmi > 25 && bmi < 29.90) {
        return 'อ้วนระดับ 1';
      } else {
        return 'อ้วนระดับ 2 (อันตราย)';
      }
    }

    String bmiFeedback(double bmi) {
      if (bmi < 18.5) {
        return 'ค่า BMI น้อยกว่า 18.5 แสดงว่าอยู่ในเกณฑ์น้ำหนักต่ำกว่าเกณฑ์หรือผอม ซึ่งอาจส่งผลเสียต่อสุขภาพได้หลายประการ ดังนั้นควรเพิ่มน้ำหนักอย่างค่อยเป็นค่อยไป เพื่อให้ร่างกายได้รับสารอาหารและพลังงานที่เพียงพอ และควรปรึกษาแพทย์หรือนักโภชนาการเพื่อขอคำแนะนำที่เหมาะสมกับตนเอง';
      } else if (bmi >= 18.5 && bmi < 22.90) {
        return 'ค่า BMI ระหว่าง 18.5 - 22.90 ซึ่งอยู่ในเกณฑ์ปกติ ห่างไกลโรคที่เกิดจากความอ้วน และมีความเสี่ยงต่อการเกิดโรคต่าง ๆ น้อยที่สุด แต่ก็ควรพยายามรักษาระดับค่า BMI ให้อยู่ในระดับนี้ให้นานที่สุด และควรตรวจสุขภาพทุกปี';
      } else if (bmi >= 23 && bmi < 24.90) {
        return 'ค่า BMI ระหว่าง 23 - 24.90 ซึ่งอยู่ในเกณฑ์น้ำหนักเกิน เสี่ยงต่อการเกิดโรคบางชนิด เช่น โรคหัวใจ โรคเบาหวานชนิดที่ 2 โรคข้อเข่าเสื่อม เป็นต้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างสม่ำเสมอ';
      } else if (bmi > 25 && bmi < 30) {
        return 'ค่า BMI ระหว่าง 25 - 29.90  ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 1 เสี่ยงต่อการเกิดโรคต่าง ๆ มากขึ้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นมากขึ้น และอาจต้องปรึกษาแพทย์หรือนักโภชนาการ';
      } else {
        return 'ค่า BMI มากกว่า 30 ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 2 เสี่ยงต่อการเกิดโรคต่าง ๆ มาก ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นที่สุด และอาจต้องปรึกษาแพทย์หรือนักโภชนาการเพื่อรับการรักษา';
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(1);
                        });
                      },
                      child: ContainerBox(
                        boxColor: maleBoxColor,
                        childwidget: const DataContainer(
                          icon: FontAwesomeIcons.person,
                          title: 'ผู้ชาย',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(2);
                        });
                      },
                      child: ContainerBox(
                        boxColor: femaleBoxColor,
                        childwidget: const DataContainer(
                          icon: FontAwesomeIcons.personDress,
                          title: 'ผู้หญิง',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ContainerBox(
                boxColor: inActiveColor,
                childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'ส่วนสูง',
                      style: textStyle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: textStyle2,
                        ),
                        const Text(
                          'ซม.',
                          style: textStyle1,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: activeColor,
                      inactiveColor: inActiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ContainerBox(
                      boxColor: inActiveColor,
                      childwidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'น้ำหนัก',
                            style: textStyle1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: textStyle2,
                              ),
                              const Text(
                                'กก.',
                                style: textStyle1,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerBox(
                      boxColor: inActiveColor,
                      childwidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'อายุ',
                            style: textStyle1,
                          ),
                          Text(
                            age.toString(),
                            style: textStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) {
                                      age++;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = bmiFeedback(double.parse(result));
                  String interpretation = getInterpretation(double.parse(result));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: result,
                        resultDetail: resultDetail,
                        interpretation:
                            interpretation, // Pass interpretation to ResultPage
                      ),
                    ),
                  );
                });
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Text(
                    'คำนวณ',
                    style: textStyle3,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
