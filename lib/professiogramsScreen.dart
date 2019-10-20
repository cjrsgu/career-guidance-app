import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:career_guidance/professiogramScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

class ProfessiogramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel viewModel) =>
          ProfessiogramsList(viewModel),
    );
  }
}

class ProfessiogramsList extends StatelessWidget {
  final _ViewModel model;

  ProfessiogramsList(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: model.professiograms
          .map((Professiogram professiogram) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  padding: EdgeInsets.all(10.0),
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: Center(
                      child: Container(
                    child: Text(professiogram.name),
                    alignment: Alignment(-1.0, 0.0),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfessiogramScreen(professiograms: professiogram),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}

class _ViewModel {
  final List<Professiogram> professiograms;

  _ViewModel({
    this.professiograms,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      professiograms: store.state.professiograms,
    );
  }
}
