import 'package:flutter/material.dart';

@immutable
class Question {
  final String? question;
  final String? answer0;
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? correctAnswer;

  const Question({
    this.question,
    this.answer0,
    this.answer1,
    this.answer2,
    this.answer3,
    this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json['question'] as String?,
        answer0: json['answer0'] as String?,
        answer1: json['answer1'] as String?,
        answer2: json['answer2'] as String?,
        answer3: json['answer3'] as String?,
        correctAnswer: json['correctAnswer'] as String?,
      );
}
