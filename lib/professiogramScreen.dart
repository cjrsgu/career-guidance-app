import 'package:flutter/material.dart';

class ProfessiogramScreen extends StatelessWidget {
  final professiograms;

  ProfessiogramScreen({Key key, @required this.professiograms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text(professiograms.name),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Особенности профессии:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(professiograms.description),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(
                'Профессионально важные качества:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(professiograms.importantProperty),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(
                'Медицинские противопоказания:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(professiograms.medicalContraindications),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(
                'Пути получения профессии:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: Text(professiograms.ways),
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
          ],
        ));
  }
}
