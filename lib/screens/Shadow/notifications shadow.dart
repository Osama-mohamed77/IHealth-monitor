import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/Dpmore%20deteils.dart';

class NotificationsShadow extends StatelessWidget {
  const NotificationsShadow({super.key});
  static String id = 'notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffA9A360),
        title: const Center(
          child: Text(
            'Notifications',
            style: TextStyle(
              fontFamily: 'alata',
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: ListView(children: [
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MoreDeteilsDiabetics.id);
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
