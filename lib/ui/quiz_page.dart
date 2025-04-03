// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/quiz_response_model.dart';
import 'package:quiz_app_2/repository/quiz.dart';
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
  QuizRepository _repository = QuizRepository();
  PageController controller = PageController();
  int index = 0;
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
            Text(widget.categoryString==null?'All': widget.categoryString!),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemCount: quizResponseModel?.results.length ?? 0,
                itemBuilder: (context, index) {
                  return QuizWidgetPage(
                    quizResultsModel: quizResponseModel!.results[index],
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
