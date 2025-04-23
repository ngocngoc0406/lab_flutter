// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizPage());
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = Icon(Icons.check, color: Colors.green);
  final crossIcon = Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Trái đất quay quanh mặt trời trong khoảng 365 ngày', true),
    Question('HTML là một ngôn ngữ lập trình', false),
    Question(
      'Ngôn ngữ Dart được sử dụng trong phát triển ứng dụng Flutter',
      true,
    ),
    Question('Thành phố Hồ Chí Minh là thủ đô của Việt Nam', false),
    Question('CPU là thành phần xử lý chính trong máy tính', true),
    Question('Java không hỗ trợ lập trình hướng đối tượng', false),
    Question('Flutter sử dụng ngôn ngữ lập trình C++ để viết giao diện', false),
    Question(
      'Thư viện “Provider” thường được dùng để quản lý trạng thái trong Flutter',
      true,
    ),
    Question('Nước ở thể lỏng khi ở 0 độ C', false),
    Question('Con người có 5 giác quan cơ bản', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xFF333333), body: _body()),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
            child: Text(
              questionsList[count].question,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),
            Row(children: iconsList),
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      setState(() {
        iconsList.add(tickIcon);

        if (count < questionsList.length - 1) count++;
      });
    } else {
      setState(() {
        iconsList.add(crossIcon);
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
