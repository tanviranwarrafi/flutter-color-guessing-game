import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final Map<String, int> rgb;
  final Function(int, int, int) onOption;

  ColorOption({required this.onOption, required this.rgb});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onOption(rgb['red']!, rgb['green']!, rgb['blue']!),
        child: Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.all(10),
          color: Color.fromRGBO(rgb['red']!, rgb['green']!, rgb['blue']!, 1),
        ),
      ),
    );
  }
}
