import 'package:flutter/material.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int count = 50;
  String v = 'Question amount';
  // String selectedCategory = 'data1';

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
          Slider(
            activeColor: Color(0xffBE52F2),
            padding: EdgeInsets.symmetric(horizontal: 65),
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
            padding: const EdgeInsets.only(right: 220, top: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: DropdownButton(dropdownColor: Colors.amber, isExpanded: true, menuMaxHeight: 30,
              items: [
                DropdownMenuItem(child: Text('All')),
                // DropdownMenuItem(child: Text('data2')),
                // DropdownMenuItem(child: Text('data3')),
                // DropdownMenuItem(child: Text('data4')),
                // DropdownMenuItem(child: Text('data5')),
              ],
                  
              onChanged: (v) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220, top: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: DropdownButton(dropdownColor: Colors.amber, isExpanded: true, menuMaxHeight: 30,
              items: [
                DropdownMenuItem(child: Text('All')),
                // DropdownMenuItem(child: Text('data2')),
                // DropdownMenuItem(child: Text('data3')),
                // DropdownMenuItem(child: Text('data4')),
                // DropdownMenuItem(child: Text('data5')),
              ],
                  
              onChanged: (v) {},
            ),
          ),
          SizedBox(height: 50),
          Container(
            
            height: 48, width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xff6979f8),),
            child: InkWell(
              
              onTap: () {},
            child: Text('START', style: TextStyle(fontSize: 16, fontFamily: 'SFProText'),),
            ),
          )
        ],
      ),
    );
  }
}
