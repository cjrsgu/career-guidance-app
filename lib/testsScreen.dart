import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:career_guidance/testScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

class TestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel viewModel) =>
          TestsList(viewModel),
    );
  }
}

class TestsList extends StatelessWidget {
  final _ViewModel model;

  TestsList(this.model) {
    if (model.tests.length == 0) {
      model.onSetTestsFromJson();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: model.tests
          .map((Test test) => GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  padding: EdgeInsets.all(10.0),
                  height: 50,
                  color: Colors.lightBlueAccent,
                  child: Center(
                      child: Container(
                    child: Text(test.name),
                    alignment: Alignment(-1.0, 0.0),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                        TestScreen(questions: test.questions, name: test.name, setAnswer: model.onSetAnswer, testId: test.id),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}

class _ViewModel {
  final List<Test> tests;
  final Function() onSetTestsFromJson;
  final Function(int id, int answer, int testId) onSetAnswer;

  _ViewModel({
    this.tests,
    this.onSetTestsFromJson,
    this.onSetAnswer,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onSetTestsFromJsonAsync(Store<AppState> store) async {
      String jsonString =
          await rootBundle.loadString('assets/tests.json');
      List<dynamic> item = json.decode(jsonString)['tests'].toList();

      store.dispatch(SetTestsFromJsonAction(item));
    }

    _onSetTestsFromJson() {
      store.dispatch(_onSetTestsFromJsonAsync);
    }

    _onSetAnswer(id, answer, testId) {
      store.dispatch(SetAnswerAction(id, answer, testId));
    }

    return _ViewModel(
      tests: store.state.tests,
      onSetTestsFromJson: _onSetTestsFromJson,
      onSetAnswer: _onSetAnswer,
    );
  }
}
