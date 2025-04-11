import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HistoryState();
  }
}

class _HistoryState extends State<HistoryScreen> {
  HistoryListModel? historyListModel;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyListModel?.histories.length ?? 0,
      itemBuilder: (context, index) {
        return Text(
          '${historyListModel!.histories[index].correctAnswer}/${historyListModel!.histories[index].totalAnswer}',
        );
      },
    );
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString('History');
    if (value != null) {
      HistoryListModel history = HistoryListModel.fromJson(value);

      setState(() {
        historyListModel = history;
      });
    }
  }
}
