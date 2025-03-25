import 'package:flutter/material.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int count = 50;
  String v = 'Question amount';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'SFProText',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                alignment: Alignment.center,
                height: 75,
                width: 50,
                child: Image.asset('assets/images/AR_Tut.png'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 65, bottom: 15),
                child: Text(
                  'Questions amount:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SFProText',
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  '10',
                  style: TextStyle(fontSize: 16, fontFamily: 'SFProText'),
                ),
              ),
            ],
          ),
          Slider(activeColor: Color(0xffBE52F2),
            padding: EdgeInsets.only(left: 65, right: 65),
            min: 1,
            max: 50,
            label: count.toString(),
            value: count.toDouble(),
            onChanged: (v) {
              setState(() {
                count = v.toInt();
              });
            },
          ),
          Padding(
                padding: const EdgeInsets.only(right: 155, top:  20),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SFProText',
                    color: Colors.grey,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
