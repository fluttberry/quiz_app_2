import 'package:flutter/material.dart';
import 'package:quiz_app_2/ui/home/quiz_home_page.dart';


void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizHomePage());
  }
}
