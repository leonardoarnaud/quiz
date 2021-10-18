import 'package:flutter/material.dart';

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

  int number = 0;

  final questions = [
    'Qual sua cor favorita?',
    'Qual animal você mais gosta?',
    'Onde fica sua cidade?'
  ];

  void respond({int q = 0}){
    setState(() {
      number = q;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Olá mundo')
      ),
      body: Column(
        children: [
          Text(questions[number]),
          ElevatedButton(
              onPressed: () => respond(q: 0) ,
              child: const Text('Resposta 1')
          ),
          ElevatedButton(
              onPressed: () => respond(q: 1) ,
              child: const Text('Resposta 2')
          ),
          ElevatedButton(
            onPressed: () => respond(q: 2) ,
            child: const Text('Resposta 3'),
          ),
        ],
      ),
    );
  }
}


