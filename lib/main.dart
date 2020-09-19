import 'package:flutter/material.dart';

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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var quizQuestions = [
      'Wat is het beste huisdier?',
      'Wat is de beste plek om games te spelen?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mijn eerste applicatie'),
        ),
        body: Column(
          children: [
            Text(quizQuestions[questionIndex]),
            RaisedButton(
              child: Text('Antwoord 1'),
              onPressed: () => print('Antwoord 1 gekozen!'),
            ),
            RaisedButton(
              child: Text('Antwoord 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Antwoord 3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
