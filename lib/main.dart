
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

  final List<Map<String, Object>> questions = [
    {
      'text': 'Qual sua cor favorita?',
      'answers': ['Preto','Vermelho','Verde','Branco']
    },
    {
      'text': 'Qual seu animal favorito?',
      'answers': ['Coelho','Cobra', 'Elefante','Leão']
    },
    {
      'text': 'Qual seu instrutor favorito?',
      'answers': ['João','Leo', 'Maria','Pedro']
    },
  ];

  bool isQuizFinish(){
    return _position >= questions.length;
  }

  void _sendAnswer(){
    setState(() {
      _position++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Olá mundo')
      ),
      body: isQuizFinish()
        ? const Result()
        : Quiz(
            title: questions[_position]['text'].toString(),
            questions: questions[_position]['answers'] as List<String>,
            onSendAnswer: () => _sendAnswer(),
          ),
    );
  }
}