// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/quiz_response_model.dart';
import 'package:quiz_app_2/repository/quiz_repository.dart';
import 'package:quiz_app_2/ui/widget/quiz_widget_page.dart';

class QuizPage extends StatefulWidget {
  final int count;
  final String? difficulty;
  final int? category;
  final String? categoryString;
  const QuizPage({
    super.key,
    required this.count,
    required this.difficulty,
    required this.category,
    required this.categoryString,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizResponseModel? quizResponseModel;
  final QuizRepository _repository = QuizRepository();
  PageController controller = PageController();
  int index = 1;
  @override
  void initState() {
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
    // controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  widget.categoryString == null
                      ? 'All'
                      : widget.categoryString!,
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,

                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 24),
              ],
            ),
            SizedBox(
              width: 170,
              child: LinearProgressIndicator(value: index / widget.count),
            ),
            Text('$index/${widget.count}'),

            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value + 1;
                  });
                },
                itemCount: quizResponseModel?.results.length ?? 0,
                itemBuilder: (context, index) {
                  return QuizWidgetPage(
                    quizResultsModel: quizResponseModel!.results[index],
                    next: () {
                      controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
