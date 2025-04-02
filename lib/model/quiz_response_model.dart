import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizResponseModel {
  List<QuizResultsModel> results;
  QuizResponseModel({
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizResponseModel.fromMap(Map<String, dynamic> map) {
    return QuizResponseModel(
      results: List<QuizResultsModel>.from((map['results'] ).map<QuizResultsModel>((x) => QuizResultsModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizResponseModel.fromJson(String source) => QuizResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class QuizResultsModel {
  String type;
  String difficulty;
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  List<String> mixedAnswers;
  QuizResultsModel({
    required this.type,
    required this.difficulty,
    required this.category, 
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.mixedAnswers,
  }) {
    mixedAnswers.add(correctAnswer);
    mixedAnswers.addAll(incorrectAnswers);
    mixedAnswers.shuffle();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'difficulty': difficulty,
      'category': category,
      'question': question,
      'correctAnswer': correctAnswer,
      'incorrectAnswers': incorrectAnswers,
      'mixedAnswers': mixedAnswers,
    };
  }

  factory QuizResultsModel.fromMap(Map<String, dynamic> map) {
    return QuizResultsModel(
      type: map['type'] as String,
      difficulty: map['difficulty'] as String,
      category: map['category'] as String,
      question: map['question'] as String,
      correctAnswer: map['correct_answer'] as String,
      incorrectAnswers: List<String>.from(map['incorrect_answers'] as List<String>,
      ),
      mixedAnswers: [],
    );
   
  } 

  String toJson() => json.encode(toMap());

  factory QuizResultsModel.fromJson(String source) =>
      QuizResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
