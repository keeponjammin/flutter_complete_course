import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mijn eerste applicatie'),
        ),
        body: Text('Dit is mijn eerste app!'),
      ),
    );
  }
}
