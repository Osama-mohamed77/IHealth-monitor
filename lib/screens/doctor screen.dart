// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class doctorExplain extends StatelessWidget {
  const doctorExplain({super.key});

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
              image: AssetImage('assets/images/doctor.png'),
              height: 232,
              width: 249,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text('Doctor!',
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
                      'IHealth monitor will simplify your workflow,\nEnhancing communication and raising the level of patient care.',
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
            height: 200,
          )
        ],
      ),
    );
  }
}
