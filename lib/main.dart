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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    //print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var quizQuestions = [
      {
        'questionText': 'Wat is het beste huisdier?',
        'answers': ['Cavia', 'Kat', 'Hond', 'Olifant']
      },
      {
        'questionText': 'Wat is de beste programmeertaal?',
        'answers': ['Dart', 'C#', 'PHP', 'JavaScript']
      },
      {
        'questionText':
            'Wie kan het niet laten mij te onderbreken tijdens werk?',
        'answers': ['Martine', 'Martine', 'Martine', 'Martine']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Super Sexy Jeroen App'),
        ),
        body: Column(
          children: [
            Question(
              quizQuestions[_questionIndex]['questionText'],
            ),
            ...(quizQuestions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
