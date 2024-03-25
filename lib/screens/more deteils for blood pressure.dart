// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class moreDeteils extends StatelessWidget {
  const moreDeteils({super.key});
  static String id = 'moreDeteils';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 360,
            height: 84,
            decoration: const BoxDecoration(
              color: Color(0xff92b28f),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Blood pressure patients',
                    style: TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 25,
                        color: Color(0xff000000),
                        height: -1),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 0,
                  )),
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo_doctor_home.png'),
                        height: 40,
                      ),
                      Text(
                        'Doctor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 14,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
