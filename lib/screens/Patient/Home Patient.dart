// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';

class HomePatients extends StatefulWidget {
  const HomePatients({super.key});
  static String id = 'HomeDoctor';

  @override
  State<HomePatients> createState() => _HomePatientsState();
}

class _HomePatientsState extends State<HomePatients> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color(0xff69B5AB)),
            height: 160,
            width: 360,
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Hi,Eslam777',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 30,
                            color: Colors.black,
                          )),
                      Expanded(
                          child: SizedBox(
                        width: 0,
                      )),
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/logo-pateint.png'),
                            height: 60,
                          ),
                          Text(
                            'Patient',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              height: .9,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 22,
                      ),
                      Text('We are ready to help you',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 17,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ChooseType.id);
                  },
                  child: Container(
                    height: 170,
                    width: 140,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: const Color(0xffB2B2B2)),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: const Color(0xffEDEDED)),
                    child: const Column(
                      children: [
                        Image(
                            image: AssetImage(
                                'assets/images/Enter measurements.png')),
                        SizedBox(
                          height: 5,
                        ),
                        Text('        Enter \nmeasurements',
                            style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 15,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 170,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: const Color(0xffB2B2B2)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: const Color(0xffEDEDED)),
                  child: const Column(
                    children: [
                      Image(image: AssetImage('assets/images/clinic.png')),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Clinic',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Container(
                  height: 170,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: const Color(0xffB2B2B2)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: const Color(0xffEDEDED)),
                  child: const Column(
                    children: [
                      Image(image: AssetImage('assets/images/Laboratory.png')),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Laboratory',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 170,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: const Color(0xffB2B2B2)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: const Color(0xffEDEDED)),
                  child: const Column(
                    children: [
                      Image(image: AssetImage('assets/images/Measuring.png')),
                      SizedBox(
                        height: 6,
                      ),
                      Text('Measuring \n   devices',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: const Color(0xffB2B2B2)),
                      borderRadius: BorderRadius.circular(20),
                      color:  const Color(0xffEDEDED)),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('View all test results',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      Spacer(
                        flex: 1,
                      ),
                      Icon(Icons.arrow_forward_outlined),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
