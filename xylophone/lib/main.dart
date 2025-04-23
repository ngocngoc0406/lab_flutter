import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(String fileName) {
    final player = AudioPlayer();
    player.play(AssetSource(fileName));
  }

  Widget buildKey(Color color,String sound) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () => playSound(sound),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            buildKey(Colors.red, 'note1.wav'),
            buildKey(Colors.orange, 'note2.wav'),
            buildKey(Colors.yellow, 'note3.wav'),
            buildKey(Colors.green, 'note4.wav'),
            buildKey(Colors.lightGreen, 'note5.wav'),
            buildKey(Colors.blue, 'note6.wav'),
            buildKey(Colors.purple, 'note7.wav'),
          ],
        ),
      ),
    );
  }
}