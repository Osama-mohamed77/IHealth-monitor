// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class PatientExplain extends StatelessWidget {
  const PatientExplain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1C2731),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 0,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/مريض2-removebg-preview.png'),
              height: 263,
              width: 400,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text('Patient!',
              style: TextStyle(
                  fontSize: 35, fontFamily: 'alata', color: Colors.white)),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                      textAlign: TextAlign.center,
                      'IHealth monitor will allow you to follow your doctor at all times, record your readings, remind you of appointments, and you can even allow another person to monitor your condition.',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'alata',
                          color: Color(0xff7C8894))),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 160,
          )
        ],
      ),
    );
  }
}
