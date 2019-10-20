import 'package:career_guidance/model/model.dart';

class SetProfessiogramsFromJsonAction {
  List<Professiogram> _professiograms;

  SetProfessiogramsFromJsonAction(item) {
    this._professiograms = List<Professiogram>.generate(
        item.length, (i) => Professiogram.fromJson(item[i]));
  }

  List<Professiogram> get professiograms => _professiograms;
}

class SetQuestionsFromJsonAction {
  List<Question> _questions;

  SetQuestionsFromJsonAction(item) {
    this._questions = List<Question>.generate(
        item.length, (i) => Question(question: item[i], answer: 0));
  }

  List<Question> get questions => _questions;
}

class SetTestsFromJsonAction {
  List<Test> _tests;

  SetTestsFromJsonAction(item) {
    this._tests = List<Test>.generate(
        item.length,
        (i) => Test(
            name: item[i]['name'],
            id: item[i]['id'],
            questions: List<Question>.generate(item[i]['questions'].length,
                (j) => Question(question: item[i]['questions'][j], answer: 0))));
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