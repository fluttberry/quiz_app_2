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
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              widget.quizResultsModel.question,
              style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
        for (String answer in widget.quizResultsModel.mixedAnswers)
          InkWell(
            onTap: () {},
            child: Container(
              width: 280,
              height: 40,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
