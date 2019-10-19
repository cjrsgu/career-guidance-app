import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:career_guidance/professiogramScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

class ProfessiogramsScreen extends StatelessWidget {
  bool fetched = false;

  setFetched() {
    print('fetched');
    fetched = true;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) =>
            Column(children: <Widget>[
              Expanded(
                child: ProfessiogramsList(viewModel, fetched, setFetched),
              ),
              RaisedButton(
                onPressed: viewModel.onSetProfessiogramsFromJson,
                child: Text('press'),
              )
            ]));
  }
}

class ProfessiogramsList extends StatelessWidget {
  final _ViewModel model;

  ProfessiogramsList(this.model, fetched, setFetched) {
    if (!fetched) {
      print('sdf');
      setFetched();
      model.onSetProfessiogramsFromJson();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: model.professiograms
          .map((Professiogram professiogram) => GestureDetector(
                child: Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Center(child: Text(professiogram.name)),
                ),
                onTap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfessiogramScreen(data: professiogram),
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
  final Function() onSetProfessiogramsFromJson;

  _ViewModel({
    this.professiograms,
    this.onSetProfessiogramsFromJson,
  });

  factory _ViewModel.create(Store<AppState> store) {
    print('test2');
    _onSetProfessiogramsFromJsonAsync(Store<AppState> store) async {
      String jsonString = await rootBundle
          .loadString('assets/professiograms.json');
      List<dynamic> item = json.decode(jsonString)['professiograms'].toList();
      store.dispatch(SetProfessiogramsFromJsonAction(item));
    }

    _onSetProfessiogramsFromJson() {
      store.dispatch(_onSetProfessiogramsFromJsonAsync);
    }

    return _ViewModel(
      professiograms: store.state.professiograms,
      onSetProfessiogramsFromJson: _onSetProfessiogramsFromJson,
    );
  }
}
