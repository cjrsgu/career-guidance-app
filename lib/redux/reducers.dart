import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    professiograms: professiogramReducer(state.professiograms, action),
  );
}

List<Professiogram> professiogramReducer(List<Professiogram> state, action) {
  if (action is SetProfessiogramsFromJsonAction) {
    print('gerter');
    return []
      ..addAll(state)
      ..addAll(action.professiograms);
  }

  return state;
}
