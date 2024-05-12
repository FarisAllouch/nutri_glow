import 'package:flutter/material.dart';

List<Question> questions = [
  Question(
    text: "Your Height",
    type: QuestionType.number,
    controller: TextEditingController(),
  ),
  Question(
    text: "Your Weight",
    type: QuestionType.number,
    controller: TextEditingController(),
  ),
  Question(
      text: "Do you have any medical conditions? If yes, please specify below.",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "What is the family history of illnesses?",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Do you have any food or drug allergies?",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Food intolerances",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Type of food you prefer to eat",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Athlete yes/no, training intensity",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Primary goal (gain weight, lose weight)",
      type: QuestionType.text,
      controller: TextEditingController()),
  Question(
      text: "Data on blood pressure, glucose, HDL, LDL, triglycerides",
      type: QuestionType.text,
      controller: TextEditingController()),
];

enum QuestionType {
  text,
  number,
}

class Question {
  final String text;
  final QuestionType type;

  final TextEditingController controller;

  Question({
    required this.text,
    required this.type,
    required this.controller,
  });
}
