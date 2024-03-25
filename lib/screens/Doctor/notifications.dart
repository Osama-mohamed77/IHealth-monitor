// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});
  static String id = 'notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(children: [
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
                  'Notifications',
                  style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 25,
                      color: Color(0xff000000),
                      height: -.2),
                ),
                Spacer(
                  flex: 1,
                ),
                Column(
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
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, moreDeteilsDiabetics.id);
          },
          child: NotificationsTest(
              'Abdallah ahmed,  added new \nmeasurements today 15/April'),
        ),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Osama mohamed,  added new \nmeasurements today 16/April'),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Mariam samwel,  added new \nmeasurements today 17/April'),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Rina samir,  added new \nmeasurements today 18/April'),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Ahmed mohamed,  added new \nmeasurements today 19/April'),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Adham mohamed,  added new \nmeasurements today 20/April'),
        const SizedBox(
          height: 15,
        ),
        NotificationsTest(
            'Mohamed abdallah,  added new \nmeasurements today 21/April'),
      ]),
    );
  }

  Widget NotificationsTest(String text) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            width: 322,
            height: 70,
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
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'alata',
                    fontSize: 15,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
