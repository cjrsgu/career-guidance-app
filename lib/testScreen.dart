import 'package:flutter/material.dart';
import 'package:career_guidance/model/model.dart';

class TestScreen extends StatelessWidget {
  final name;
  final questions;
  final setAnswer;
  final testId;

  TestScreen({
    Key key,
    @required this.name,
    @required this.questions,
    @required this.setAnswer,
    @required this.testId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<QuestionWidget> questionsList = List<QuestionWidget>.generate(
        questions.length,
        (i) => QuestionWidget(
            question: questions[i].question,
            answer: questions[i].answer,
            setAnswer: setAnswer,
            id: i,
            testId: testId));
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: ListView(
          children: questionsList,
        ));
  }
}

class QuestionWidget extends StatefulWidget {
  final question;
  int answer;
  Function(int id, int answer, int testId) setAnswer;
  int id;
  int testId;

  QuestionWidget({
    Key key,
    @required this.question,
    @required this.answer,
    @required this.setAnswer,
    @required this.id,
    @required this.testId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuestionState();
  }
}

class QuestionState extends State<QuestionWidget> {
  int answer;

  @override
  initState() {
    super.initState();
    answer = widget.answer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.question,
          style: TextStyle(
              color: answer > 0
                  ? Colors.green
                  : answer == 0 ? Colors.black : Colors.red),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                widget.setAnswer(widget.id, 1, widget.testId);
                setState(() {
                  answer = 1;
                });
              },
            ),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                widget.setAnswer(widget.id, -1, widget.testId);
                setState(() {
                  answer = -1;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
