import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Magic8BallApp());
}

class Magic8BallApp extends StatelessWidget {
  const Magic8BallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Magic 8 Ball",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            backgroundColor: Colors.blueAccent[800],
          ),
          body: const Magic8Ball(),
          backgroundColor: Colors.blueAccent[400],
        )
    );

  }
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({super.key});

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ball = 1;
  void setBall(){
    setState(() {
      ball = Random().nextInt(5) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: (){
                  setBall();
                },
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                      "assets/ball$ball.png"
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}