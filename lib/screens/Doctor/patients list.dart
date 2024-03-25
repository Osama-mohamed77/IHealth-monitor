// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class patientsList extends StatelessWidget {
  const patientsList({super.key});
  static String id = 'patientsList';
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
                    'My patients',
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
          patients('Abdallah ahmed'),
          const SizedBox(
            height: 40,
          ),
          patients('Mohamed abdallah'),
          const SizedBox(
            height: 40,
          ),
          patients('Adham mohamed'),
          const SizedBox(
            height: 40,
          ),
          patients('Ahmed mohamed'),
          const SizedBox(
            height: 40,
          ),
          patients('Rina samir'),
          const SizedBox(
            height: 40,
          ),
          patients('Mariam samwel'),
          const SizedBox(
            height: 40,
          ),
          patients('Osama mohamed'),
        ],
      ),
    );
  }

  Widget patients(String name) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Container(
            height: 50,
            width: 325,
            decoration: BoxDecoration(
                color: const Color(0xffCEDBCD),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'alata',
                    fontSize: 15,
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  width: 0,
                )),
                Container(
                  height: 25,
                  width: 81,
                  decoration: const BoxDecoration(
                      color: Color(0xffC5C5C5),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Text(
                    'Remove',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'alata',
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
