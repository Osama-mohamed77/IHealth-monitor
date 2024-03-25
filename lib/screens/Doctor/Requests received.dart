// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/Requests.dart';

class RequestsReceived extends StatelessWidget {
  const RequestsReceived({super.key});
  static String id = 'Requests received';
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
                    ' Requests received',
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 25,
                      color: Color(0xff000000),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Column(
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
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Requests(
            username: 'Adham777',
            name: 'Adham mohamed',
            image: 'assets/images/photo1.png',
          ),
          const SizedBox(
            height: 40,
          ),
          const Requests(
            username: 'Ahmed777',
            name: 'Ahmed mohamed',
            image: 'assets/images/photo2.png',
          ),
          const SizedBox(
            height: 40,
          ),
          const Requests(
            username: 'Mazin777',
            name: 'Mazin samir',
            image: 'assets/images/photo3.png',
          ),
          const SizedBox(
            height: 40,
          ),
          const Requests(
            username: 'Eslam777',
            name: 'Eslam mohamed',
            image: 'assets/images/photo4.png',
          ),
        ],
      ),
    );
  }
}
