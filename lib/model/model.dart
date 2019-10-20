import 'package:flutter/foundation.dart';

class Professiogram {
  final String name;
  final String description;
  final String knowledge;
  final String importantProperty;
  final String medicalContraindications;
  final String ways;

  Professiogram({
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

  Professiogram copyWith({String name, String description, String knowledge, String importantProperty, String medicalContraindications, String ways}) {
    return Professiogram(
      name: name ?? this.name,
      description: description ?? this.description,
      knowledge: knowledge ?? this.knowledge,
      importantProperty: importantProperty ?? this.importantProperty,
      medicalContraindications: medicalContraindications ?? this.medicalContraindications,
      ways: ways ?? this.ways,
    );
  }
}

class Question {
  final String question;
  final int answer;

  Question({
    @required this.question,
    @required this.answer,
  });

  Question copyWith({String question, String answer }) {
    return Question(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}

class Test {
  final int id;
  final String name;

  Test({
    @required this.id,
    @required this.name,
  });

  Test copyWith({int id, String name }) {
    return Test(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class AppState {
  final List<Professiogram> professiograms;
  final List<Professiogram> questions;
  final List<Test> tests;

  AppState({
    @required this.professiograms,
    @required this.questions,
    @required this.tests,
  });

  AppState.initialState() : professiograms = List.unmodifiable(<Professiogram>[]),
  questions = List.unmodifiable(<Professiogram>[]),
  tests = List.unmodifiable(<Test>[]);
}