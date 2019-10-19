import 'package:flutter/material.dart';

class ProfessiogramScreen extends StatelessWidget {
  final data;

  ProfessiogramScreen({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Column(children: <Widget>[
      Row(children: <Widget>[
        Text('имя'),
        Text(data.name),
      ],),
      Row(children: <Widget>[
        Text('Особенности профессии'),
        Text(data.description),
      ],),
      Row(children: <Widget>[
        Text('Профессионально важные качества'),
        Text(data.importantProperty),
      ],),
      Row(children: <Widget>[
        Text('Медицинские противопоказания'),
        Text(data.medicalContraindications),
      ],),
      Row(children: <Widget>[
        Text('Пути получения профессии'),
        Text(data.ways),
      ],),
    ],)
    );
  }
}
/* class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
 */