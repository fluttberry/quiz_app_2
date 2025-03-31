import 'package:flutter/material.dart';
import 'package:quiz_app_2/ui/home/history_screen.dart';
import 'package:quiz_app_2/ui/home/quiz_screen.dart';
import 'package:quiz_app_2/ui/home/settings_screen.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [QuizScreen(), HistoryScreen(), SettingsScreen()],
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey.shade50,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Explore_Active.png',
              color: index == 0 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Map_Inactive.png',
              color: index == 1 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Profile_Inactive.png',
              color: index == 2 ? Color(0xffBE52F2) : Colors.grey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
