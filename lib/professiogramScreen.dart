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
        body: ListView(
        padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              child: professiograms.description != '' ? Text(
                'Особенности профессии:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.description != '' ? Text(professiograms.description) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.importantProperty != '' ? Text(
                'Профессионально важные качества:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.importantProperty != '' ? Text(professiograms.importantProperty) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.medicalContraindications != '' ? Text(
                'Медицинские противопоказания:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.medicalContraindications != '' ? Text(professiograms.medicalContraindications) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.ways != '' ? Text(
                'Пути получения профессии:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
            Container(
              child: professiograms.ways != '' ? Text(professiograms.ways) : null,
              alignment: AlignmentDirectional(-1.0, -1.0),
            ),
          ],
        ));
  }
}
