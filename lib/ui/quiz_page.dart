// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final int count;
  final String? difficulty;
  final int? category;
  const QuizPage({
    super.key,
    required this.count,
    required this.difficulty,
    required this.category,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(width: 100, height: 100, color: Colors.amber);
        },
      ),
    );
  }
}
