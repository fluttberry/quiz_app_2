// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_app_2/model/quiz_response_model.dart';

class QuizWidgetPage extends StatefulWidget {
  final QuizResultsModel quizResultsModel;
  const QuizWidgetPage({super.key, required this.quizResultsModel});
  @override
  State<QuizWidgetPage> createState() => _QuizWidgetPageState();
}

class _QuizWidgetPageState extends State<QuizWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.quizResultsModel.question),
        for (String ans in widget.quizResultsModel.mixedAnswers)
        ElevatedButton(onPressed: (){}, child: Text( ans),),
       
      ],
    );
  }
}
