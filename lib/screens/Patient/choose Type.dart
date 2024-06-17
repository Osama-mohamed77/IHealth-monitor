import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_Pressure.dart';
import 'package:ihealth_monitor/screens/Patient/select_date_suger.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({super.key});
  static String id = 'ChooseType';

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69B5AB),
        title: const Row(
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
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(
        children: [
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
                    Navigator.pushNamed(context, SelectDateSuger.id);
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SelectDateBlood.id);
                  },
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
