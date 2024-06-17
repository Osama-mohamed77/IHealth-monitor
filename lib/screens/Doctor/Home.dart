import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/blood_pressure_patients.dart';
import 'package:ihealth_monitor/screens/Doctor/Diabetics%20screen.dart';

class HomeDoctor extends StatefulWidget {
  const HomeDoctor({super.key});
  static String id = 'HomeDoctor';

  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  String username = '';
  Future<void> fetchData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Doctors')
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
                color: Color(0xff92B28F)),
            height: 214,
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
                            image: AssetImage(
                                'assets/images/logo_doctor_home.png'),
                            height: 60,
                          ),
                          Text(
                            'Doctor',
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
                      Text('Ready to follow up on your patients!',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 300,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search',
                                hintStyle: TextStyle(height: 1),
                                filled: true,
                                fillColor: Color(0xffD9D9D9)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BloodPressure.id);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffD2EAD0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    height: 140,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Blood pressure patients',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'You can see all blood pressure \n              patients here.',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            color: Color(0xff7A7A7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DiabeticsPatients.id);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      color: Color(0xffD2EAD0),
                    ),
                    height: 140,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Diabetics',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'You can see all diabetics here.',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            color: Color(0xff7A7A7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, Calendar.id);
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'Wait',
                      desc: 'This service will be added soon',
                      btnOkOnPress: () {},
                    ).show();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffD2EAD0),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    height: 140,
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Others',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'You can see the rest of your patients here.',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 16,
                            color: Color(0xff7A7A7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
