import 'package:flutter/material.dart';
import './Quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionIndex = 0;
  var _totalScore =0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore =0;
    });
  }
  final _questionAnswers = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 9},
        {'text': 'White', 'score': 2},
        {'text': 'Pink', 'score': 10},
        {'text': 'Purple', 'score': 7}
      ]
    },
    {
      'questionText': 'What\'s your favourite pet?',
      'answers': [
        {'text': 'Horse', 'score': 10},
        {'text': 'Peacock', 'score': 2},
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favourite movie?',
      'answers': [
        {'text': 'Harry Potter', 'score': 10},
        {'text': 'Lucifer', 'score': 4},
        {'text': 'Avengers', 'score': 7},
        {'text': 'Iron Man', 'score': 8}
      ]
    },
    {
      'questionText': 'Who\'s your favourite Actress?',
      'answers': [
        {'text': 'Aishwariya', 'score': 10},
        {'text': 'Kiara', 'score': 7},
        {'text': 'Avneet', 'score': 9},
        {'text': 'Dhrumi', 'score': 9}
      ]
    },
  ];

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fun Quiz'),
        ),
        body: _questionIndex < _questionAnswers.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionAnswers: _questionAnswers,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
