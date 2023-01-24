import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/*************************************
 * My ID is
 * "com.onatcipli.networkUppimply"
 * password
 * IloveLJ2022!
 *******************************************/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override

  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Welcome and Get Ready to Learn!',
      'answers': [
        {'text': 'Perfect, this will be fun!', 'score': 0},
        {'text': 'Okay, let me do this!', 'score': 0},
        {'text': 'Fine, I will try!', 'score': 0},
      ],
    },
    {
      'questionText': 'What is hardware?',
      'answers': [
        {'text': 'Computer hardware is a program that is important to '
            'run a computer', 'score': 0},
        {'text': 'It is the hardest part of programming an app', 'score': 0},
        {'text': 'Computer hardware is the collection of physical parts of a '
            'computer system', 'score': 1},
        {'text': 'It has to deal with the security of your computer',
          'score': 0},
      ],
    },
    {
      'questionText': 'What is software?',
      'answers': [
        {'text': 'It is what keeps the computer system safe', 'score': 0},
        {'text': 'Computer software is the physical parts of the computer '
            'system', 'score': 0},
        {'text': 'It is not important to the function of the computer',
          'score': 0},
        {'text':
          'Computer software is the programs and apps that instruct the '
              'computer to perform tasks', 'score': 1},
      ],
    },
    {
      'questionText': 'What is artificial intelligence?',
      'answers': [
        {'text': 'AI is a smart machine that does not require training data, '
            'it work on algorithms only', 'score': 0},
        {'text': 'AI uses logic and prior experience to '
            'simulate human intelligence. ', 'score': 1},
        {'text': 'AI includes things like web design.', 'score': 0},
        {'text': 'It is about robots taking over the earth', 'score': 0},
      ],
    },
    {
      'questionText': 'What is virtual reality?',
      'answers': [
        {'text': 'The use of computers to simulate a real or imagined '
            'environment that appears as a 3-D space.', 'score': 1},
        {'text': 'It is the next phase of social media coming in the near '
            'future', 'score': 0},
        {'text': 'VR cannot be used for medicine, sports, entertainment, nor '
            'art', 'score': 0},
        {'text': 'VR is about replacing reality with a new 3-D environment',
          'score': 0},
      ],
    },
    {
      'questionText': 'In an intelligent classroom, technology is used to '
          'facilitate learning and communication.',
      'answers': [
        {'text': 'False', 'score': 0},
        {'text': 'True', 'score': 1},
      ],
    },
  ];

  final _optional= const [
    {
      'questionText': 'What is an integrated circuit?',
      'answers': [
        {'text': 'Chip or microchip that cannot perform the same '
            'function as a discrete circuit', 'score': 0},
        {'text': 'An electronic circuit formed on a small piece of '
            'semiconducting material.', 'score': 2},
        {'text': 'Both of the above answers are correct', 'score': 0},
      ],
    },
    {
      'questionText': 'What is a microprocessor?',
      'answers': [
        {'text': 'It is a computer processor that incorporates the functions '
          'of a central processing unit on a single or (more) integrated '
          'circuit.', 'score': 2},
        {'text': 'It is the procedure that must happen before anything is '
        'displayed for the user to view', 'score': 0},
        {'text': 'With exactly the same functionality, a microprocessor is '
            'just another word for a central processing unit(CPU)', 'score': 0},
      ],
    },
    {
      'questionText': 'What does IoT?',
      'answers': [
        {'text': 'It stand for Internet of Things, it is in everything '
            'from the microwave to the regular chairs we sit on', 'score': 0},
        {'text': 'It is the same as the traditional internet thought the use of'
            ' just computers and phones', 'score': 0},
        {'text': 'It is a network of all products and equipment that contain '
            'processors and can communicate with one another via internet.',
          'score': 2},
      ],
    },
    {
      'questionText': 'What are sticky keys?',
      'answers': [
        {'text': 'Keys that only stay active when pressing them in order to '
            'use them', 'score': 0},
        {'text': 'It is an accessibility feature made to assists users who have'
            ' physical disabilities', 'score': 2},
        {'text': 'Sticky Keys enables the user to enter key combinations by '
            'pressing keys simultaneously rather than sequentially',
          'score': 0},
      ],
    },
    {
      'questionText': 'What are script kiddies?',
      'answers': [
        {'text': 'a person who uses existing computer scripts or code to hack '
            'into computers, lacking the expertise to write their own.',
          'score': 0},
        {'text': 'An immature, but often just as dangerous, exploiters of '
            'internet security weaknesses', 'score': 0},
        {'text': 'Both of the Above', 'score': 2},
      ],
    },
  ];

  var _totalAmount = 0;
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 1;
      _totalScore = 0;
      _totalAmount = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    _totalAmount = 5;
    _optionalIndex == _optional.length; //so the optional questions will not play
  }

  var _optionalIndex = 10;

  void _optionalQuiz() {
    setState(() {
      _optionalIndex = 0;
      _totalScore = 0;
      _totalAmount = 10;
    });
  }

  void _answer(int score) {
    _totalScore += score;

    setState(() {
      _optionalIndex = _optionalIndex + 1;
    });
    if(_totalAmount == 5){
      _totalAmount = 15;
    }
  }

  void _resetAll(){
    setState(() {
      _optionalIndex = 0;
      _questionIndex = 1;
      _totalScore = 0;
      _totalAmount = 0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simply CS'),
          backgroundColor: Colors.pinkAccent, //(0xFFFF4081),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child:
            Column(
            children: [
              if(_questionIndex < _questions.length) ...[
                Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                )
              ]
              else if(_optionalIndex < _optional.length) ...[
                Quiz(
                answerQuestion: _answer,
                questionIndex: _optionalIndex,
                questions: _optional,
                )
              ]
              else ...[
                Result(_totalAmount, _totalScore,
                    _resetQuiz, _optionalQuiz, _resetAll),
              ],
            ],
          ),
        ),//Padding
      ),//Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp2
  }
}


