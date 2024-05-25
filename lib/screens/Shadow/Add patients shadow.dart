// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';

class AddPatientsShadow extends StatelessWidget {
  const AddPatientsShadow({super.key});
  static String id = 'AddPatientsShadow';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffA9A360),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Add Patients',
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        children: [
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
                color: const Color(0xffA9A360),
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
                  color: const Color(0xffA9A360),
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
