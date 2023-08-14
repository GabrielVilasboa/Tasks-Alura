

import 'package:flutter/material.dart';

class Difficult extends StatelessWidget {

  final int difficultLevel;

  const Difficult({ required this.difficultLevel, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: difficultLevel >= 1
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultLevel >= 2
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultLevel >= 3
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultLevel >= 4
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultLevel >= 5
                ? Colors.blue
                : Colors.blue[100]),
      ],
    );
  }
}