import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/Booking_date.dart';
import 'package:ihealth_monitor/screens/Patient/Measuring%20devices.dart';
import 'package:ihealth_monitor/screens/Patient/choose%20Type.dart';
import 'package:ihealth_monitor/screens/Patient/clinic.dart';
import 'package:ihealth_monitor/screens/Patient/laboratory.dart';
import 'package:ihealth_monitor/screens/Patient/test_result.dart';

class HomePatients extends StatefulWidget {
  const HomePatients({super.key});
  static String id = 'HomeDoctor';

  @override
  State<HomePatients> createState() => _HomePatientsState();
}

class _HomePatientsState extends State<HomePatients> {
  String username = '';
  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Use the correct document ID here
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          username = documentSnapshot['userName'];
        });
      } else {}
    } catch (e) {
      return;
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
            height: 130,
            width: 360,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Hi,$username',
                          style: const TextStyle(
                            fontFamily: 'alata',
                            fontSize: 30,
                            color: Colors.black,
                          )),
                      const Expanded(
                          child: SizedBox(
                        width: 0,
                      )),
                      const Column(
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
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 22,
                      ),
                      Text('We are ready to help you',
                          style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 17,
                              color: Colors.black,
                              height: .5)),
                    ],
                  ),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ClinicScreen.id);
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LabScreen.id);
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
                        Image(
                            image: AssetImage('assets/images/Laboratory.png')),
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
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PharmacyScreen.id);
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TestResults.id);
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
                        Image(
                            image: AssetImage('assets/images/test result.jpg')),
                        SizedBox(
                          height: 12,
                        ),
                        Text('test results',
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BookingDate.id);
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
                            image:
                                AssetImage('assets/images/booking date.jpg')),
                        SizedBox(
                          height: 6,
                        ),
                        Text('Booking date',
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
                width: 25,
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
