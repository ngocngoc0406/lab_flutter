import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "I am Poor",
          style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold,fontSize: 28),
        ),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("I am So Poor",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),),
          SizedBox(height: 60,),
          Image.asset("assets/images/coal.png")
        ],

      ),



    );
  }
}
