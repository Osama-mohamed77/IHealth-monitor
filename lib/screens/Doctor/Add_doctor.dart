// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';

class AddDoctor extends StatelessWidget {
  const AddDoctor({super.key});
  static String id = 'AddPatients';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
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
                    width: 40,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Add patients',
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 25,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo_doctor_home.png'),
                        height: 50,
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
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Add your patients in Briga',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 27,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'You will need both their username and a tag. Keep in \nmind that username is case sensitive',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'alata', fontSize: 13, color: Color(0xff8D8D8D)),
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username000',
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Your username is Osama777',
                style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 13,
                    color: Color(0xff8D8D8D)),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 270,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xff92b28f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Send Request',
                  style: TextStyle(
                    fontFamily: 'Alata',
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RequestsReceived.id);
              },
              child: Container(
                width: 270,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xff92b28f),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    ' Requests received',
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
