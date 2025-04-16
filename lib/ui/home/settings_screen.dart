import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Settings',
      
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'SFProText',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),
            height: 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share this app',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xffbe52f2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),
            height: 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rate us',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xffbe52f2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),
            height: 90,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leave fedback',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xffbe52f2),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              // sharedPreferences.clear();
              sharedPreferences.remove('History');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffEEEEEE)),
              ),
              height: 90,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clear history',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SFProText',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xffbe52f2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
