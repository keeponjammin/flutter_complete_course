import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  final _quizQuestions = const [
    {
      'questionText': 'Wat is het beste huisdier?',
      'answers': [
        {'text': 'Cavia', 'score': 4},
        {'text': 'Hond', 'score': 1},
        {'text': 'Kat', 'score': 2},
        {'text': 'Olifant', 'score': 3},
      ]
    },
    {
      'questionText': 'Wat is de beste programmeertaal?',
      'answers': [
        {'text': 'C#', 'score': 4},
        {'text': 'Dart', 'score': 3},
        {'text': 'PHP', 'score': 1},
        {'text': 'JavaScript', 'score': 2},
      ]
    },
    {
      'questionText': 'Wie kan het niet laten mij te onderbreken tijdens werk?',
      'answers': [
        {'text': 'Martine', 'score': 4},
        {'text': 'Martine', 'score': 4},
        {'text': 'Martine', 'score': 4},
        {'text': 'Martine', 'score': 4},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _quizQuestions.length) {
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
        body: _questionIndex < _quizQuestions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                quizQuestions: _quizQuestions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
