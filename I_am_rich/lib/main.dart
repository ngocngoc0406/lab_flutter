import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
              "I Am Rich App",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange
              )
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: const Center(
          child: Image(
            image: AssetImage("assets/image/diamond.png"),
          ),
        ),
      ),
    )
  );
}