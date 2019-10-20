import 'package:career_guidance/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SetTestsFromJsonAction {
  List<Test> _tests;

  SetTestsFromJsonAction(item) {
    this._tests = List<Test>.generate(
      item.length,
      (i) => Test(
        name: item[i]['name'],
        id: item[i]['id'],
        questions: List<Question>.generate(
          item[i]['questions'].length,
          (j) =>
            Question(question: item[i]['questions'][j], answer: 0))));
  }

  List<Test> get tests => _tests;
}

class SetAnswerAction {
  int _id;
  int _answer;
  int _testId;

  SetAnswerAction(id, answer, testId) {
    this._id = id;
    this._answer = answer;
    this._testId = testId;
  }

  get id => this._id;

  get answer => this._answer;

  get testId => this._testId;
}

class RequestDataEventsAction {}

class CancelDataEventsAction {}

class ProfessiogramsOnDataEventAction {
  QuerySnapshot _data;

  ProfessiogramsOnDataEventAction(data) {
    this._data = data;
  }

  get data => this._data;
}
