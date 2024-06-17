import 'package:flutter/material.dart';

class ShadowExplain extends StatelessWidget {
  const ShadowExplain({super.key});

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
              image: AssetImage('assets/images/شادو-removebg-preview.png'),
              height: 220,
              width: 400,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text('Shadow!',
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
                      'IHealth monitor will allow you to follow up your patient and send you alerts if medications are not taken on time or measurements are not entered.',
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
