import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorial/components/buttons/elevate_button.dart';
import 'package:tutorial/libraries/toast_popup.dart';
import 'package:tutorial/screens/components/color-options.dart';
import 'package:tutorial/themes/colors.dart';
import 'package:tutorial/themes/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var random = Random();

  var randomR = 0;
  var randomG = 0;
  var randomB = 0;
  var totalScore = 0;
  var questionCount = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white, title: const Text('Guess the Color')),
      body: Container(width: size.width, height: size.height, child: questionCount < 10 ? _questionSection : _resultSection),
    );
  }

  Widget get _questionSection {
    randomR = random.nextInt(256);
    randomG = random.nextInt(256);
    randomB = random.nextInt(256);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(color: primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Text(
            'RGB ($randomR, $randomG, $randomB)',
            textAlign: TextAlign.center,
            style: TextStyles.text26_600.copyWith(color: dark),
          ),
        ),
        ColorOptions(
          randomR: randomR,
          randomB: randomB,
          randomG: randomG,
          onOption: (red, green, blue) => _chooseAnswer(red: red, green: green, blue: blue),
        ),
      ],
    );
  }

  Widget get _resultSection {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.accessibility, color: primary, size: 64),
          Text('Your score is', style: TextStyles.text22_600.copyWith(color: dark)),
          Text('$totalScore out of $questionCount', style: TextStyles.text22_600.copyWith(color: dark)),
          const SizedBox(height: 24),
          ElevateButton(
            label: 'RESTART',
            onTap: _resetGame,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  void _resetGame() {
    totalScore = 0;
    questionCount = 0;
    setState(() {});
  }

  void _chooseAnswer({int red = 0, int green = 0, int blue = 0}) {
    Fluttertoast.cancel();
    var isAnswer = red == randomR && green == randomG && blue == randomB;
    if (isAnswer) {
      ToastPopup.onSuccess(message: 'Correct Answer', isTop: true);
      totalScore += 1;
    } else {
      ToastPopup.onWarning(message: 'Wrong Answer', isTop: true);
    }
    questionCount += 1;
    setState(() {});
  }
}
