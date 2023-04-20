import 'dart:math';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      decoration: BoxDecoration(
        color: getRandomColor(),
        borderRadius: BorderRadius.circular(21),
      ),
      width: 140,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).accentTextTheme.titleMedium!.color,
        ),
      ),
    );
  }

  final List<Color> predefinedColors = [
    Colors.indigo,
    Colors.purple,
    Colors.black54,
    Colors.blueAccent,
    Colors.grey[900]!,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.pink,
    Colors.redAccent
  ];

  Color getRandomColor() {
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }
}
