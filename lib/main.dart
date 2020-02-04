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
  final _questions = const [
    {
      'questionText': 'What\'s your Favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your Favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 3},
        {'text': 'Elephant', 'score': 11},
        {'text': 'Giraffe', 'score': 5},
        {'text': 'Gorilla', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your Favourite movie?',
      'answers': [
        {'text': 'Stuber', 'score': 7},
        {'text': 'Split', 'score': 6},
        {'text': 'Endgame', 'score': 0},
        {'text': 'Intersteller', 'score': 1},
      ],
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
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
