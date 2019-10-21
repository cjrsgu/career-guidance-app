import 'package:flutter/material.dart';

class ProfessiogramScreen extends StatelessWidget {
  final professiograms;

  ProfessiogramScreen({Key key, @required this.professiograms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(professiograms.name),
      ),
      body: ProfessiogramBody(professiograms.fields),
    );
  }
}

class ProfessiogramBody extends StatelessWidget {
  final List fields;

  ProfessiogramBody(this.fields);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fields.length,
      itemBuilder: (context, i) {
        return new ExpansionTile(
          title: FutureBuilder(
            future: fields[i]['name'].get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  return Text(snapshot.data['value'] as String,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic));
              }
              return Text('');
            },
          ),
          children: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(fields[i]['value'] as String,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.justify,
                    ),
              ),
            )
          ],
        );
      },
    );
  }
}

class Field {
  final String title;
  final String content;

  Field(this.title, this.content);
}
