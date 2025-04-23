import 'package:flutter/material.dart';
import 'package:destini/storybrain.dart';

void main() {
  runApp(DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Roboto',
            ),
      ),
      home: DestiniScreen(),
    );
  }
}

storyBrain StoryBrain = storyBrain();

class DestiniScreen extends StatefulWidget {
  const DestiniScreen({Key? key}) : super(key: key);

  @override
  State<DestiniScreen> createState() => _DestiniScreenState();
}

class _DestiniScreenState extends State<DestiniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/galaxy.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      StoryBrain.getStory(),
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    StoryBrain.nextStory(1);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  StoryBrain.getChoice1(),
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 12.0),
              Visibility(
                visible: StoryBrain.buttonShouldBeVisible(),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      StoryBrain.nextStory(2);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    StoryBrain.getChoice2(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
