// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Requests%20received.dart';

class AddDoctors extends StatefulWidget {
  const AddDoctors({super.key});
  static String id = 'AddDoctors';

  @override
  State<AddDoctors> createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: const Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Text('Add followers',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 25,
                  color: Colors.black,
                )),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Text(
            'Add your followers in \nIHealth monitor',
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
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 270,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xff69B5AB),
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
                  color: const Color(0xff69B5AB),
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
