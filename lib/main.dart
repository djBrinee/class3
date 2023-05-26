import 'package:class3/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

QuizBrain quiz = new QuizBrain();
List<Widget> scoreKeeper = [];
int goodAnswers = 0;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Wrap(
              children: scoreKeeper,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctAnswer = quiz.getQuestionAnswer;
                if (correctAnswer) {
                  if (!quiz.lastQuestion()) {
                    scoreKeeper.add(placeCheckIcon());
                    goodAnswers++;
                  }
                } else {
                  if (!quiz.lastQuestion()) {
                    scoreKeeper.add(placeCloseIcon());
                  }
                }
                setState(() {
                  quiz.nextQuestion();
                  if (quiz.lastQuestion()) {
                    _showAlertDialog(goodAnswers.toString());
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getQuestionAnswer;
                if (!correctAnswer) {
                  if (!quiz.lastQuestion()) {
                    scoreKeeper.add(placeCheckIcon());
                    goodAnswers++;
                  }
                } else {
                  if (!quiz.lastQuestion()) {
                    scoreKeeper.add(placeCloseIcon());
                  }
                }
                setState(() {
                  quiz.nextQuestion();
                  if (quiz.lastQuestion()) {
                    _showAlertDialog(goodAnswers.toString());
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }

  Icon placeCloseIcon() {
    return const Icon(Icons.close, size: 30, color: Color.fromARGB(255, 242, 38, 23));
  }

  Icon placeCheckIcon() {
    return const Icon(Icons.check, size: 30, color: Color.fromARGB(255, 95, 240, 23));
  }

  Future<void> _showAlertDialog(String correctAnswers) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You've finished the game",
              style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 4, 31, 154))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You had a total of ${correctAnswers} over ${scoreKeeper.length} total answers. You can play again by pressing restart.',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Reestart',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  scoreKeeper = [];
                  quiz.restartApp();
                  goodAnswers = 0;
                });
              },
            ),
          ],
        );
      },
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
