import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// loading animation  for 30 second

//
QuestionBank questions = new QuestionBank();

class Quizer extends StatefulWidget {
  @override
  _QuizerState createState() => _QuizerState();
}

class _QuizerState extends State<Quizer> {
  int question_number = 0;
  int correct_answer = 0;
  List<Widget> score_keeper_list = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expanded(
            //     child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       child: Text(" 4 gamers"),
            //       color: Colors.orange,
            //       height: 50,
            //     ),
            //     Container(
            //       child: Text(" 8 gamers"),
            //       color: Colors.blue,
            //       height: 50,
            //     ),
            //     Container(
            //       color: Colors.green,
            //       height: 50,
            //       child: Text(" 6 gamers"),
            //     ),
            //     Container(
            //       color: Colors.red,
            //       height: 50,
            //       child: Text(" 10 gamers"),
            //     )
            //   ],
            // )
            // ),
            Expanded(
                flex: 5,
                child: Center(
                    child: Text(questions.getQuestions(question_number),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)))),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('True',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      onPressed: () {
                        setState(() {
                          check_answer(
                              questions.getCorrectAnswer(question_number),
                              true);
                        });
                        if (question_number <
                            questions.getNumberOfQuestions() - 1) {
                          question_number = question_number + 1;
                        } else if (question_number ==
                            questions.getNumberOfQuestions() - 1) {
                          show_result(question_number);
                        } //The user picked true.
//                    checkAnswer(true);
                      })),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("False",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  onPressed: () {
                    setState(() {
                      check_answer(
                          questions.getCorrectAnswer(question_number), false);
                      if (question_number <
                          questions.getNumberOfQuestions() - 1) {
                        question_number = question_number + 1;
                      } else if (question_number ==
                          questions.getNumberOfQuestions() - 1) {
                        show_result(question_number);
                      }
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: score_keeper_list,
              ),
            ),
            Expanded(
                child: RaisedButton(
              color: Colors.teal,
              child: Text("Start again!"),
              onPressed: () {
                setState(() {
                  question_number = 0;
                  score_keeper_list = [];
                  correct_answer = 0;
                });
              },
            ))
          ],
        ),
      ),
    );
  }

  void check_answer(answer, bool clicked_answer) {
    if (answer == clicked_answer) {
      score_keeper_list.add(Icon(Icons.check, color: Colors.green));
      correct_answer = correct_answer + 1;
    } else
      score_keeper_list.add(Icon(Icons.close, color: Colors.red));
  }

  void show_result(int question_number) {
    if (correct_answer == questions.getNumberOfQuestions() - 1) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Result!",
        desc: "Congrats!\n You won!",
        buttons: [
          DialogButton(
            child: Text(
              correct_answer.toString() +
                  "over " +
                  questions.getNumberOfQuestions().toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else if (correct_answer > 1) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Your result is !",
        desc: "Congrats!\n You won!",
        buttons: [
          DialogButton(
            child: Text(
              correct_answer.toString() +
                  "over " +
                  questions.getNumberOfQuestions().toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Result!",
        desc: "Congrats!\n You won!",
        buttons: [
          DialogButton(
            child: Text(
              correct_answer.toString() +
                  "over " +
                  questions.getNumberOfQuestions().toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }
}
