// ignore_for_file: file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';

// ignore: camel_case_types
class SettingsShadow extends StatefulWidget {
  const SettingsShadow({super.key});
  static String id = 'SettingsShadow';

  @override
  State<SettingsShadow> createState() => _SettingsShadowState();
}

class _SettingsShadowState extends State<SettingsShadow> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5C5C5),
      body: Center(
        child: ListView(
          children: [
            Container(
              width: 0,
              height: 194,
              decoration: const BoxDecoration(
                color: Color(0xffCFCCAE),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 28,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: const Color(0xffD9D9D9))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                  fontFamily: 'Alata',
                                  fontSize: 20,
                                  color: Color(0xff6B6B6B),
                                ),
                              ),
                              SizedBox(
                                width: 145,
                              )
                            ],
                          ),
                          Text(
                            'Osama mohamed',
                            style: TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 23,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 13,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Alata',
                    fontSize: 20,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    width: 0,
                    decoration: const BoxDecoration(
                        color: Color(0xffCFCCAE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.person,
                          color: Color(0xff17366F),
                          size: 35,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Account details',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 23,
                            color: Color(0xff000000),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          width: 60,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    width: 0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 67, 63, 63),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    width: 0,
                    decoration: const BoxDecoration(
                      color: Color(0xffCFCCAE),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.people,
                          color: Color(0xff17366F),
                          size: 35,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'My patients',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 23,
                            color: Color(0xff000000),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          width: 60,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    width: 0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 67, 63, 63),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    width: 0,
                    decoration: const BoxDecoration(
                      color: Color(0xffCFCCAE),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Color(0xff17366F),
                          size: 35,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Text(
                          'Notification',
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontSize: 23,
                            color: Color(0xff000000),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        FlutterSwitch(
                          width: 50.0,
                          height: 20.0,
                          valueFontSize: 20,
                          toggleSize: 15,
                          value: status,
                          borderRadius: 30.0,
                          padding: 4.0,
                          activeColor: const Color(0xff17366F),
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, signInShadow.id, (route) => false);
                    },
                    child: Container(
                      height: 70,
                      width: 0,
                      decoration: const BoxDecoration(
                        color: Color(0xffCFCCAE),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.logout,
                            color: Color(0xff17366F),
                            size: 35,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'Alata',
                              fontSize: 23,
                              color: Color(0xff000000),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
