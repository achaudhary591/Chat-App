import 'dart:math';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isMe);

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Row(
      children: [
        Container(
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
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
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
    Colors.redAccent,
    Colors.brown,
    Colors.deepPurple,
    Colors.teal,
    Colors.pinkAccent
  ];

  Color getRandomColor() {
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }
}
