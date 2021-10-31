
import 'package:flutter/material.dart';

import 'answer.dart';
import 'questions.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget()
    );
  }

}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  int _position = 0;
  int _score = 0;

  final List<Map<String, Object>> questions = [
    {
      'text': 'Qual sua cor favorita?',
      'answers': [
        AnswerData(title: 'Preto', value: 1),
        AnswerData(title: 'Vermelho', value: 0),
        AnswerData(title: 'Verde', value: 0),
        AnswerData(title: 'Brance', value: 0),
      ],

    },
    {
      'text': 'Qual seu animal favorito?',
      'answers': [
        AnswerData(title: 'Coelho', value: 0),
        AnswerData(title: 'Cobra', value: 1),
        AnswerData(title: 'Elefant', value: 0),
        AnswerData(title: 'Leão', value: 0),
      ]
    },
    {
      'text': 'Qual seu instrutor favorito?',
      'answers': [
        AnswerData(title: 'João', value: 0),
        AnswerData(title: 'Leo', value: 0),
        AnswerData(title: 'Maria', value: 1),
        AnswerData(title: 'Pedro', value: 0),
      ]
    },
  ];

  bool isQuizFinish(){
    return _position >= questions.length;
  }

  void _restart(){
    setState(() {
      _position = 0;
      _score = 0;
    });
  }

  void _sendAnswer(bool correct){
    setState(() {
      _position++;
      if (correct) _score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Olá mundo')
      ),
      body: isQuizFinish()
        ? Result(
          score: _score,
          onRestart: _restart,
      )
        : Quiz(
            title: questions[_position]['text'].toString(),
            answers: questions[_position]['answers'] as List<AnswerData>,
            onSendAnswer: (isCorrect) => _sendAnswer(isCorrect),
          ),
    );
  }
}