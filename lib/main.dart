import 'package:color_guessing_game_flutter/color_options.dart';
import 'package:color_guessing_game_flutter/random-rgb.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import './result.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Random random = Random();

  int randomR;
  int randomG;
  int randomB;

  int totalScore = 0;
  int questionCount = 0;

  void answerChooseHandler(int r, int g, int b) {
    if (r==randomR && g==randomG && b==randomB) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Correct Answer",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.green,
          fontSize: 16.0
      );
      setState(() {
        totalScore += 1;
        questionCount += 1;
      });
    } else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Wrong Answer",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      questionCount += 1;
    }
  }

  void resetHandler(){
    setState(() {
      totalScore = 0;
      questionCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    randomR = random.nextInt(256);
    randomG = random.nextInt(256);
    randomB = random.nextInt(256);

    return Scaffold(
      appBar: AppBar(
        title: Text('Color Guessing Game In Flutter'),
      ),
      body: questionCount < 10 ?
      Column(
        children: <Widget>[
          RGB(randomR, randomG, randomB),
          ColorOptions(randomR, randomG, randomB, answerChooseHandler),
        ],
      ) : Result(totalScore,questionCount, resetHandler),
    );
  }
}
