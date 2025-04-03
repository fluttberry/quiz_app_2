// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/quiz_response_model.dart';
import 'package:quiz_app_2/repository/quiz.dart';
import 'package:quiz_app_2/ui/widget/quiz_widget_page.dart';

class QuizPage extends StatefulWidget {
  final int count;
  final String? difficulty;
  final int? category;
  const QuizPage({
    super.key,
    required this.count,
    required this.difficulty,
    required this.category,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizResponseModel? quizResponseModel;
  QuizRepository _repository = QuizRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var quiz = await _repository.get(
      widget.count,
      widget.difficulty,
      widget.category,
    );
    setState(() {
      quizResponseModel = quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: quizResponseModel?.results.length ?? 0,
        itemBuilder: (context, index) {
          return QuizWidgetPage(
            quizResultsModel: quizResponseModel!.results[index],
          );
        },
      ),
    );
  }
}
