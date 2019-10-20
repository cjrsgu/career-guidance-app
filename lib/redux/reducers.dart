import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    professiograms: professiogramReducer(state.professiograms, action),
    tests: testReducer(state.tests, action),
  );
}

List<Professiogram> professiogramReducer(List<Professiogram> state, action) {
  if (action is ProfessiogramsOnDataEventAction) {
    List<Professiogram> list = [];
    action.data.documents.forEach((f) => list.add(Professiogram(
        name: f.data['name'],
        description: f.data['description'],
        knowledge: f.data['knowledge'],
        importantProperty: f.data['importantProperty'],
        medicalContraindications: f.data['medicalContraindications'],
        ways: f.data['ways'],
      ))
    );

    return list;
  }

  return state;
}

List<Test> testReducer(List<Test> state, action) {
  if (action is SetTestsFromJsonAction) {
    return []..addAll(state)..addAll(action.tests);
  }

  if (action is SetAnswerAction) {
    List<Test> newstate = []..addAll(state);
    newstate[action.testId].questions[action.id] = Question(
        question: newstate[action.testId].questions[action.id].question,
        answer: action.answer);
    return []..addAll(newstate);
  }

  return state;
}
