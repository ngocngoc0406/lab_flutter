import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 169, 194),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/nagi.jpg'),
              ),
              Text(
                'Nguyễn Thị Ngọc',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(
                'Mobile Developer',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white60,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 105,
                height: 1,
                child: Container(
                  color: Colors.white60,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.teal,),
                    SizedBox(width: 15,),
                    Text(
                      '+84 368505043',
                      style: TextStyle(
                          color: Colors.teal.shade800,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Icon(Icons.mail, color: Colors.teal,),
                    SizedBox(width: 15,),
                    Text(
                      'ngocnt.22itb@vku.udn.vn',
                      style: TextStyle(
                          color: Colors.teal.shade800,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}