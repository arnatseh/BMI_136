import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultDetail;
  final String interpretation;

  const ResultPage({
    Key? key,
    required this.bmiResult,
    required this.resultDetail,
    required this.interpretation,
  }) : super(key: key);

  Color _getBmiTextColor(double bmiValue) {
    if (bmiValue < 18.5) {
      return Colors.blue; // Choose your color for this range
    } else if (bmiValue >= 18.5 && bmiValue < 22.90) {
      return Colors.green; // Choose your color for this range
    } else if (bmiValue >= 23 && bmiValue < 24.90) {
      return Colors.orange; // Choose your color for this range
    } else if (bmiValue > 25 && bmiValue < 29.90) {
      return Colors.red; // Choose your color for this range
    } else {
      return Colors.purple; // Choose your color for this range
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ค่า BMI ของคุณ',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                bmiResult,
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: _getBmiTextColor(double.parse(bmiResult)),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                interpretation,
                style: TextStyle(
                  fontSize: 24.0,
                  color: _getBmiTextColor(double.parse(bmiResult))),
                textAlign: TextAlign.center,
                
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                   color: _getBmiTextColor(double.parse(bmiResult)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      resultDetail,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                child: const Text('คำนวณไหม่'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
