import 'package:career_guidance/model/model.dart';

class SetProfessiogramsFromJsonAction {
  // int _id;
  List<Professiogram> _professiograms;

  SetProfessiogramsFromJsonAction(item) {
    this._professiograms =  List<Professiogram>.generate(item.length, (i) => Professiogram.fromJson(item[i]));
  }

  List<Professiogram> get professiograms => _professiograms;
}