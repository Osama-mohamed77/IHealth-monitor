// ignore_for_file: camel_case_types, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/date.dart';
import 'package:ihealth_monitor/components/days.dart';
import 'package:ihealth_monitor/components/wait.dart';

class moreDeteilsDiabetics extends StatelessWidget {
  const moreDeteilsDiabetics({super.key});
  static String id = 'moreDeteils';
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
                    'Kmal ahmed',
                    style: TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 25,
                        color: Color(0xff000000),
                        height: -.3),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 310,
                child: Text(
                  textAlign: TextAlign.start,
                  'Blood sugar measurements',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 310,
                height: 340,
                decoration: BoxDecoration(
                  color: const Color(0xffCEDBCD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'The condition is stable',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 13,
                            color: Color(0xff150096),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 0,
                          ),
                        ),
                        Text(
                          'April',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 15,
                            color: Color(0xff000000),
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DayCont(
                          day: 'SAT',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'SUN',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'MON',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'TUE',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'WED',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'THU',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        DayCont(
                          day: 'FRI',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '1',
                          measurement: '115',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '2',
                          measurement: '100',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '3',
                          measurement: '110',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '4',
                          measurement: '100',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xffFF5E5E),
                          date: '5',
                          measurement: '150',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xffFF5E5E),
                          date: '6',
                          measurement: '170',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '7',
                          measurement: '115',
                        ),
                      ],
                    ),
                    // next Row///////
                    const SizedBox(
                      height: 13,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '8',
                          measurement: '100',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '9',
                          measurement: '115',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '10',
                          measurement: '110',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '11',
                          measurement: '100',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '12',
                          measurement: '115',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '13',
                          measurement: '100',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        dateCont(
                          color: Color(0xff77FF24),
                          date: '14',
                          measurement: '115',
                        ),
                      ],
                    ),
                    // next Row//////////////
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const dateCont(
                          color: Color(0xffF3FF63),
                          date: '15',
                          measurement: '65',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const dateCont(
                          color: Color(0xffF3FF63),
                          date: '16',
                          measurement: '60',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const dateCont(
                          color: Color(0xff77FF24),
                          date: '17',
                          measurement: '110',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          height: 60,
                          decoration:
                              const BoxDecoration(color: Color(0xffCEDBCD)),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 10,
                              ),
                              Container(
                                width: 35,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      '18',
                                      style: TextStyle(
                                          fontFamily: 'alata',
                                          fontSize: 10,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 12,
                                      decoration: const BoxDecoration(
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ////////////////////////////////////////////////////////////////////
                        const SizedBox(
                          width: 7,
                        ),
                        const dateCont(
                          color: Color(0xff77FF24),
                          date: '19',
                          measurement: '110',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const dateCont(
                          color: Color(0xff77FF24),
                          date: '20',
                          measurement: '115',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const waitCont(
                          color: Colors.white,
                          date: '21',
                        ),
                      ],
                    ),
                    // next Row////////////////////
                    const SizedBox(
                      height: 7,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '22',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '23',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '24',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '25',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '26',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '27',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '28',
                        ),
                      ],
                    ),
                    // next Row//////////////////////////
                    const SizedBox(
                      height: 13,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '29',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '30',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        waitCont(
                          color: Colors.white,
                          date: '31',
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 310,
                child: Text(
                  textAlign: TextAlign.start,
                  'Test results',
                  style: TextStyle(
                    fontFamily: 'alata',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 310,
              height: 320,
              decoration: BoxDecoration(
                color: const Color(0xffcedbcd),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/Test.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image(
                        image: AssetImage('assets/images/test 2.jpg'),
                      ),
                    ],
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
