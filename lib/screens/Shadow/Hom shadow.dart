// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Shadow/more%20details.dart';

class HomeShadow extends StatefulWidget {
  const HomeShadow({super.key});
  static String id = 'HomeShadow';

  @override
  State<HomeShadow> createState() => _HomeShadowState();
}

class _HomeShadowState extends State<HomeShadow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF7E5),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffA9A360)),
            height: 150,
            width: 300,
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Hi,Ahmed777',
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
                            image: AssetImage('assets/images/Logo shadow.png'),
                            height: 60,
                          ),
                          Text(
                            'Shadow',
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
                      Text('Ready to follow up on your patients!',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
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
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, moreDeteilsShadow.id);
                  },
                  child: Container(
                    width: 322,
                    height: 47,
                    decoration: const BoxDecoration(
                      color: Color(0xffCFCCAE),
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
                          'Mohamed abdallah',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.monitor_heart,
                          color: Color.fromARGB(255, 234, 34, 19),
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
                    color: Color(0xffCFCCAE),
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
                        'Adham mohamed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 15,
                        ),
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
        ],
      ),
    );
  }
}
