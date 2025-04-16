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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 124,
                    width: 124,
                    child: Image.asset('assets/icons/Done.png'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 20,
                        blurRadius: 50,
                      ),
                    ],
                  ),
                  height: 174,
                  width: 342,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Categoty: ${historyModel.category}',
                          style: TextStyle(
                            
                            fontSize: 17,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Difficulty:',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          Text(
                            'Correct answers:',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${historyModel.difficulty}'),

                          Text(
                            ' ${historyModel.correctAnswer}/${historyModel.totalAnswer}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 40,
                  width: 90,

                  decoration: BoxDecoration(
                    color: Color(0xff4ce2a7),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
    // sharedPreferences.remove('History');
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
