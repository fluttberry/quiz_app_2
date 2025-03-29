import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int count = 50;
  String v = 'Question amount';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 300, bottom: 50, top: 0),
          child: Text(
            'Quiz',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'SFProText',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
              padding: const EdgeInsets.only(left: 70, bottom: 15),
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
        Slider(
          activeColor: Color(0xffBE52F2),
          padding: EdgeInsets.symmetric(horizontal: 70),
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
          padding: const EdgeInsets.only(right: 210, top: 25, bottom: 20),
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SFProText',
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                menuMaxHeight: 30,
                iconSize: 35,
                items: [
                  DropdownMenuItem(child: Text('  All')),
                  DropdownMenuItem(value: 'easy', child: Text('Easy')),
                  DropdownMenuItem(value: 'normal', child: Text('Normal')),
                  DropdownMenuItem(value: 'hard', child: Text('Hard')),
                ],

                onChanged: (v) {},
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 210, top: 25, bottom: 20),
          child: Text(
            'Difficulty',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SFProText',
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                menuMaxHeight: 30,
                iconSize: 35,
                value: null,
                items: [
                  DropdownMenuItem(child: Text('  All')),
                  DropdownMenuItem(value: 'easy', child: Text('Easy')),
                  DropdownMenuItem(value: 'normal', child: Text('Normal')),
                  DropdownMenuItem(value: 'hard', child: Text('Hard')),
                ],

                onChanged: (v) {},
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
        Container(
          height: 48,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff6979f8),
          ),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                'START',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFProText',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
