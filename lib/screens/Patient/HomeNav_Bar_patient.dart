// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ihealth_monitor/screens/Doctor/Add%20patients.dart';
import 'package:ihealth_monitor/screens/Doctor/notifications.dart';
import 'package:ihealth_monitor/screens/Doctor/settings.dart';
import 'package:ihealth_monitor/screens/Patient/Home%20Patient.dart';

class HomeNavBarPatient extends StatefulWidget {
  const HomeNavBarPatient({super.key});
  static String id = 'HomeNavBarPatient';
  @override
  State<HomeNavBarPatient> createState() => _HomeNavBarPatientState();
}

class _HomeNavBarPatientState extends State<HomeNavBarPatient> {
  int _currenIndex = 0;
  final List<Widget> listoption = <Widget>[
    const HomePatients(),
    const AddPatients(),
    const notifications(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listoption[_currenIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          child: GNav(
            selectedIndex: _currenIndex,
            onTabChange: (value) {
              setState(() {
                _currenIndex = value;
              });
            },
            haptic: true,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xff424242),
            gap: 9,
            padding: const EdgeInsets.all(11),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.person_add_alt_1,
                text: 'add ',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications ',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}