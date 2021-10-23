import 'package:flutter/material.dart';

import 'answer.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.title,
    required this.questions,
    required this.onSendAnswer,
  }) : super(key: key);

  final String title;
  final List<String> questions;
  final VoidCallback onSendAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
            text: title
        ),
        ...questions.map((answer) =>
            Answer(
              text: answer,
              onPressed: () => onSendAnswer(),
            )
        ),
      ],
    );
  }
}
