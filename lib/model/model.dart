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
    this.description,
    this.knowledge,
    this.importantProperty,
    this.medicalContraindications,
    this.ways,
  });

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
  final List<Question> questions;

  Test({
    @required this.id,
    @required this.name,
    @required this.questions,
  });

  Test copyWith({int id, String name }) {
    return Test(
      id: id ?? this.id,
      name: name ?? this.name,
      questions: questions ?? this.questions,
    );
  }
}

class AppState {
  final List<Professiogram> professiograms;
  final List<Test> tests;

  AppState({
    @required this.professiograms,
    @required this.tests,
  });

  AppState.initialState() : professiograms = List.unmodifiable(<Professiogram>[]),
  tests = List.unmodifiable(<Test>[]);
}