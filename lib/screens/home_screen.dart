import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import 'package:quizapp/widgets/option_card.dart';
import 'package:quizapp/widgets/result_box.dart';

//create home screen widget
//using stateful widget because it will be parent widget and all function
//and variables will be in this widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '1',
      title:
          'Technologies that accommodate the need for internet access via mobile devices are called',
      options: {
        'Definition of mobile web': true,
        'Mobile marketing understanding': false,
        'Mobile site benefits': false,
        'Website understanding': false
      },
    ),
    Question(
      id: '2',
      title:
          'A mobile site designed so that when the site is opened via any mobile device, the site display' +
              'will adjust to the width and height of the mobile device screen.',
      options: {
        'Mobile site types': true,
        'Mobile marketing definition': false,
        'Mobile site definition': false,
        'Mobile site benefits': false
      },
    ),
    Question(
      id: '3',
      title:
          'What programming language is often used to develop android applications?',
      options: {'Go': false, 'C++': false, 'Java': true, 'Kotlin': false},
    ),
    Question(
      id: '4',
      title: 'What is the attraction of companies that choose android?',
      options: {
        'high cost': false,
        'OS cannot be customized': false,
        'limited apps': false,
        'low cost and OS customization': true
      },
    ),
    Question(
      id: '5',
      title: 'Android applications can be distributed using, except?',
      options: {
        'Web': false,
        'Emulator': true,
        'copy APK': false,
        'Store': false
      },
    )
  ];
// create index to loop through _questions
  int index = 0;
  // create score variable
  int score = 0;
  //create a boolean value to check if the user has clicked
  bool isPressed = false;
  bool isAlreadySelected = false;
  //create a function to display next question
  void nextQuestion() {
    if (index == _questions.length - 1) {
      //this is the block when the question end.
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; //when index change to 1. rebuild app
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

//create function for changing color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

//function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //change background
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          QuestionWidget(
            indexAction: index,
            question: _questions[index].title,
            totalQuestion: _questions.length,
          ),
          const Divider(color: neutral),
          // add some space
          const SizedBox(height: 25.0),
          for (int i = 0; i < _questions[index].options.length; i++)
            GestureDetector(
              onTap: () => checkAnswerAndUpdate(
                  _questions[index].options.values.toList()[i]),
              child: OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed
                    ? _questions[index].options.values.toList()[i] == true
                        ? correct
                        : incorrect
                    : neutral,
              ),
            ),
        ]),
      ),

      //use floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//import this file to main.dart
