import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoryModel {
String difficulty;
  String category;
  int correctAnswer;
  int incorrectAnswer;
  String date; 
  HistoryModel({
    required this.difficulty,
    required this.category,
    required this.correctAnswer,
    required this.incorrectAnswer,
    required this.date,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'difficulty': difficulty,
      'category': category,
      'correctAnswer': correctAnswer,
      'incorrectAnswer': incorrectAnswer,
      'date': date,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      difficulty: map['difficulty'] as String,
      category: map['category'] as String,
      correctAnswer: map['correctAnswer'] as int,
      incorrectAnswer: map['incorrectAnswer'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
