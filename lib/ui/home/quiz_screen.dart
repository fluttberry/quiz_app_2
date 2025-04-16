import 'package:flutter/material.dart';
import 'package:quiz_app_2/model/category_model.dart';
import 'package:quiz_app_2/repository/category_repository.dart';
import 'package:quiz_app_2/ui/quiz_page.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? category;
  String? difficulty;
  CategoryModel? categoryModel;
  CategoryRepository repository = CategoryRepository();
  int count = 3;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var c = await repository.get();
    setState(() {
      categoryModel = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 300, bottom: 50, top: 0),
          child: Text(
            'Quiz2',
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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70, bottom: 15),
              child: Text(
                'Questions amount: $count',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SFProText',
                  color: Colors.grey,
                ),
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
                isExpanded: true,
                iconSize: 35,
                value: category,
                items: [
                  DropdownMenuItem(value: null, child: Text('All')),
                  for (CategoryItemModel cat
                      in categoryModel?.triviaCategories ?? [])
                    DropdownMenuItem(value: cat.id, child: Text(cat.name)),
                ],

                onChanged: (v) {
                  setState(() {
                    category = v;
                  });
                },
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
                isExpanded: true,
                iconSize: 35,
                value: difficulty,
                items: [
                  DropdownMenuItem(value: null, child: Text('All')),
                  DropdownMenuItem(value: 'easy', child: Text('Easy')),
                  DropdownMenuItem(value: 'medium', child: Text('Medium')),
                  DropdownMenuItem(value: 'hard', child: Text('Hard')),
                ],

                onChanged: (value) {
                  setState(() {
                    difficulty = value;
                  });
                },
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => QuizPage(
                        count: count,
                        difficulty: difficulty,
                        category: category,
                        categoryString:
                            category == null
                                ? null
                                : categoryModel!.triviaCategories
                                    .firstWhere((cat) => cat.id == category)
                                    .name,
                      ),
                ),
              );
            },
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
