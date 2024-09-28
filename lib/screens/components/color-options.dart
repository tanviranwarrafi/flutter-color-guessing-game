import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutorial/screens/components/color-option.dart';

class ColorOptions extends StatelessWidget {
  final int randomR;
  final int randomG;
  final int randomB;

  final Function(int, int, int) onOption;

  ColorOptions({required this.onOption, this.randomR = 0, this.randomG = 0, this.randomB = 0});

  @override
  Widget build(BuildContext context) {
    var random = Random();
    var optionList = <int>[0, 1, 2, 3];
    var answer = random.nextInt(4);
    optionList.remove(answer);
    var randomOptions = {
      answer: {'red': randomR, 'green': randomG, 'blue': randomB},
      optionList[0]: {'red': random.nextInt(256), 'green': random.nextInt(256), 'blue': random.nextInt(256)},
      optionList[1]: {'red': random.nextInt(256), 'green': random.nextInt(256), 'blue': random.nextInt(256)},
      optionList[2]: {'red': random.nextInt(256), 'green': random.nextInt(256), 'blue': random.nextInt(256)},
    };
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorOption(rgb: randomOptions[0]!, onOption: onOption),
            ColorOption(rgb: randomOptions[1]!, onOption: onOption),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorOption(rgb: randomOptions[2]!, onOption: onOption),
            ColorOption(rgb: randomOptions[3]!, onOption: onOption),
          ],
        ),
      ],
    );
  }
}
