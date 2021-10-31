import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.score,
    required this.onRestart,
  }) : super(key: key);

  final int score;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getScoreText(),
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          ElevatedButton(
            child: const Text('Restart'),
            onPressed: onRestart,
          ),
        ],
      ),
    );
  }

  String getScoreText() {
    if (score < 1) {
      return "Errou tudo!";
    } else if (score < 2) {
      return "Acertou 1!";
    } else if (score < 3) {
      return "Bom!";
    } else {
      return "Parabéns!";
    }
  }
}


