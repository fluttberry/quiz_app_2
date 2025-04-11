// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/history_model.dart';

class ResultPage extends StatelessWidget {
  final HistoryModel historyModel;
  const ResultPage({super.key, required this.historyModel});

  @override
  Widget build(BuildContext context) {
    ();
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

  // save() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var value = sharedPreferences.getString('History');
  //   if (value != null) {
  //     HistoryListModel historyListModel = HistoryListModel.fromJson(value);
  //     historyListModel.histories.add(historyModel);
  //     sharedPreferences.setString('History', historyListModel.toJson());
  //   } else {
  //     HistoryListModel historyListModel = HistoryListModel(
  //       histories: [historyModel],
  //     );
  //     sharedPreferences.setString('History', historyListModel.toJson());
  //   }
  // }
}
