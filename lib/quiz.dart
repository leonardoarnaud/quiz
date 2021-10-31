import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'answer.dart';
import 'questions.dart';


class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.title,
    required this.answers,
    required this.onSendAnswer,
  }) : super(key: key);

  final String title;
  final List<AnswerData> answers;
  final void Function(bool) onSendAnswer;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Question(
            text: title
        ),
        ...answers.map((answer) =>
            Answer(
              text: answer.title,
              onPressed: () => onSendAnswer(answer.value == 1),
            )
        ),
      ],
    );
  }
}
