// ignore_for_file: use_build_context_synchronously, file_names, prefer_final_fields, unused_field
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/select%20date.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({super.key});
  static String id = 'ChooseType';

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
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
            height: 74,
            width: 360,
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Text('Enter measurements',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 25,
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
                            height: 40,
                          ),
                          Text(
                            'Patient',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 15,
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          const Center(
            child: Text('Please select your type of \n         measurements',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: 20,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 90,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SelectDate.id);
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff69B5AB)),
                    child: const Center(
                      child: Text('Sugar measurements',
                          style: TextStyle(
                            fontFamily: 'alata',
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff69B5AB)),
                  child: const Center(
                    child: Text('Pressure measurements',
                        style: TextStyle(
                          fontFamily: 'alata',
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
            ],
          )
        ],
      ),
    );
  }
}
