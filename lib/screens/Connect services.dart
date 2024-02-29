// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class ConnectExplain extends StatelessWidget {
  const ConnectExplain({super.key});

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
              image: AssetImage('assets/images/Connect services.png'),
              height: 230,
              width: 390,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text('Connect services',
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
                      'This system connects clinics, analysis centers and doctors while enabling designated relatives to monitor blood sugar and blood pressure results.',
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
            height: 180,
          )
        ],
      ),
    );
  }
}
