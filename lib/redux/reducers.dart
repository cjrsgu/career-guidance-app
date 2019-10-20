import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    professiograms: professiogramReducer(state.professiograms, action),
    questions: professiogramReducer(state.questions, action),
    tests: testReducer(state.tests, action),
  );
}

List<Professiogram> professiogramReducer(List<Professiogram> state, action) {
  if (action is SetProfessiogramsFromJsonAction) {
    return []
      ..addAll(state)
      ..addAll(action.professiograms);
  }

  return state;
}

List<Question> questionReducer(List<Question> state, action) {
  if (action is SetQuestionsFromJsonAction) {
    return []
      ..addAll(state)
      ..addAll(action.questions);
  }

  return state;
}

List<Test> testReducer(List<Test> state, action) {
  if (action is SetTestsFromJsonAction) {
    print('gerter');
    return []
      ..addAll(state)
      ..addAll(action.tests);
  }

  return state;
}

