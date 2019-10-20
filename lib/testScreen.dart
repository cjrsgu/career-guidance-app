import 'package:flutter/material.dart';
import 'package:career_guidance/model/model.dart';

class TestScreen extends StatelessWidget {
  final name;
  final questions;

  TestScreen({Key key,
  @required this.name,
  @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Text> questionsList = List<Text>.generate(questions.length, (i) => Text(questions[i].question));
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: ListView(
          children: questionsList,
        ));
  }
}
