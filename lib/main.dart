import './result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';


// void main() {
//   runApp(MyFirstApp());
// }
void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implemented createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your Favourite colour?',
      'answers': ['Black', 'Red', 'Green', 'Blue'],
    },
    {
      'questionText': 'What\'s your Favourite animal?',
      'answers': ['Lion', 'Elephant', 'Giraffe', 'Gorilla'],
    },
    {
      'questionText': 'What\'s your Favourite movie?',
      'answers': ['Stuber', 'Split', 'Endgame', 'Intersteller'],
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    } else {
      print('No more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // implemented build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions,)
            : Result()
      ),
    );
  }
}
