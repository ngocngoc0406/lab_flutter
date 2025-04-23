import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Dice",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

        ),
        body: Dice(),
      ),
    );
  }
}
class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  void setDice(){
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: (){
                    setDice();
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Image.asset(
                        'assets/dice$leftDice.png',

                      )
                  )
              ),

            ),
            Expanded(
              child: TextButton(
                  onPressed: (){
                    setDice();
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Image.asset(
                        'assets/dice$rightDice.png',

                      )
                  )
              ),

            ),
          ],
        ),
      ),
    );
  }
}