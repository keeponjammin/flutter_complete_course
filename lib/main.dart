import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final quizQuestions = const [
    {
      'questionText': 'Wat is het beste huisdier?',
      'answers': ['Cavia', 'Kat', 'Hond', 'Olifant']
    },
    {
      'questionText': 'Wat is de beste programmeertaal?',
      'answers': ['Dart', 'C#', 'PHP', 'JavaScript']
    },
    {
      'questionText': 'Wie kan het niet laten mij te onderbreken tijdens werk?',
      'answers': ['Martine', 'Martine', 'Martine', 'Martine']
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < quizQuestions.length) {
      print('We have more questions!');
    } else {
      print('We zijn klaar!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Super Sexy Jeroen App'),
        ),
        body: _questionIndex < quizQuestions.length
            ? Column(
                children: [
                  Question(
                    quizQuestions[_questionIndex]['questionText'],
                  ),
                  ...(quizQuestions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text('Goed gedaan!'),
              ),
      ),
    );
  }
}
