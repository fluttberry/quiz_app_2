// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/history_model.dart';

class ResultPage extends StatelessWidget {
  final HistoryModel historyModel;
  const ResultPage({Key? key, required this.historyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Categoty: ${historyModel.category}'),
          Text('Difficulty: ${historyModel.difficulty}'),
          Text('${historyModel.correctAnswer}/${historyModel.totalAnswer}'),
        ],
      ),
    );
  }
}
