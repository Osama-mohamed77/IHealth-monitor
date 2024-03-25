// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';

// ignore: camel_case_types
class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});
  static String id = 'ChooseScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C2731),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                height: 0,
              ),
            ),
            const Text(
              'who are you?',
              style: TextStyle(
                  fontFamily: 'alata', fontSize: 45, color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, signInPatient.id);
              },
              child: Container(
                height: 70,
                width: 210,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff69B5B4),
                ),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Patient',
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 40,
                      color: Colors.white,
                      height: 1.6),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, signInShadow.id);
              },
              child: Container(
                height: 70,
                width: 210,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xffA9A360),
                ),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Shadow',
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 40,
                      color: Colors.white,
                      height: 1.6),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, signIn.id);
              },
              child: Container(
                height: 70,
                width: 210,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff92B28F),
                ),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Doctor',
                  style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 40,
                      color: Colors.white,
                      height: 1.6),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
