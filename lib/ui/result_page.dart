// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatelessWidget {
  final HistoryModel historyModel;
  const ResultPage({super.key, required this.historyModel});

  @override
  Widget build(BuildContext context) {
    save();
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Result',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 124,
                      width: 124,
                      child: Image.asset('assets/icons/Done.png'),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [Text('Categoty: ${historyModel.category}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Difficulty: ${historyModel.difficulty}'), SizedBox(width: 20,),
                Text(
                  'Correct answers: ${historyModel.correctAnswer}/${historyModel.totalAnswer}',
                ),
                    ],),
                    ],
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('History');
    var value = sharedPreferences.getString('History');
    if (value != null) {
      HistoryListModel historyListModel = HistoryListModel.fromJson(value);
      historyListModel.histories.add(historyModel);
      sharedPreferences.setString('History', historyListModel.toJson());
    } else {
      HistoryListModel historyListModel = HistoryListModel(
        histories: [historyModel],
      );
      sharedPreferences.setString('History', historyListModel.toJson());
    }
  }
}
