import 'package:flutter/foundation.dart';

class Professiogram {
  // final int id;
  final String name;
  final String description;
  final String knowledge;
  final String importantProperty;
  final String medicalContraindications;
  final String ways;

  Professiogram({
    // @required this.id,
    @required this.name,
    @required this.description,
    @required this.knowledge,
    @required this.importantProperty,
    @required this.medicalContraindications,
    @required this.ways,
  });

  factory Professiogram.fromJson(dynamic parsedJson){
    return Professiogram(
    name:parsedJson['name'],
     description:parsedJson['description'],
     knowledge:parsedJson['knowledge'],
     importantProperty:parsedJson['importantProperty'],
     medicalContraindications:parsedJson['medicalContraindications'],
    ways: parsedJson['ways'],
    );
  }

  Professiogram copyWith({int id, String name}) {
    return Professiogram(
      // id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      knowledge: knowledge ?? this.knowledge,
      importantProperty: importantProperty ?? this.importantProperty,
      medicalContraindications: medicalContraindications ?? this.medicalContraindications,
      ways: ways ?? this.ways,
    );
  }
}

class AppState {
  final List<Professiogram> professiograms;

  AppState({
    @required this.professiograms,
  });

  AppState.initialState() : professiograms = List.unmodifiable(<Professiogram>[]);
}