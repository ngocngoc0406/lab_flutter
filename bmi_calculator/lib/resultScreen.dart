import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmi;
  final String status;
  final String advice;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.status,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Result')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Result',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Text(
            status.toUpperCase(),
            style: const TextStyle(
              color: Colors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmi,
            style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
          Text(
            'Normal BMI range:\n18.5 - 25 kg/m²',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            advice,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 80,
              color: const Color(0xFFEB1555),
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
