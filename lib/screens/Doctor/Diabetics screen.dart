// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Bpmore%20deteils.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';

class DiabeticsScreen extends StatelessWidget {
  const DiabeticsScreen({super.key});
  static String id = 'DiabeticsScreen';
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
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      size: 33,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'Diabetics',
                    style: TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 25,
                        color: Color(0xff000000),
                        height: -.2),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Column(
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
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, moreDeteilsDiabetics.id);
                  },
                  child: Container(
                    width: 322,
                    height: 47,
                    decoration: const BoxDecoration(
                      color: Color(0xffCEDBCD),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Kmal ahmed,40 M',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.bloodtype,
                          color: Color.fromARGB(255, 234, 34, 19),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 20,
                          ),
                        ),
                        Icon(
                          Icons.error_outline_sharp,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Mohamed abdallah,40 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Icon(
                        Icons.monitor_heart,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Fady mohamed,40 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Asmaa mohamed,30 F',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Icon(
                        Icons.monitor_heart,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Mazin samir,40 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Samar osama,40 F',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Osama mohamed,50 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Icon(
                        Icons.monitor_heart,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Ahmed azzam,40 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 322,
                  height: 47,
                  decoration: const BoxDecoration(
                    color: Color(0xffCEDBCD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Ahmed fady,40 M',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.bloodtype,
                        color: Color.fromARGB(255, 234, 34, 19),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Icon(
                        Icons.error_outline_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}