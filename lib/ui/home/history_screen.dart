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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'History',

            style: TextStyle(
              fontSize: 24,
              fontFamily: 'SFProText',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: getData,
            child: ListView.builder(
              itemCount: historyListModel?.histories.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
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
                  height: 90,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category ${historyListModel!.histories[index].category}',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              size: 20,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                        Text(
                          'Correct answers: ${historyListModel!.histories[index].correctAnswer}/${historyListModel!.histories[index].totalAnswer}',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Difficulty: ${historyListModel!.histories[index].difficulty}',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${historyListModel!.histories[index].date}',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> getData() async {
    // print('-----');
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
