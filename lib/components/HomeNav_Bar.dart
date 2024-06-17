import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ihealth_monitor/screens/Doctor/Add_doctor.dart';
import 'package:ihealth_monitor/screens/Doctor/Home.dart';
import 'package:ihealth_monitor/screens/Doctor/settings.dart';

class HomeNavBarDoctor extends StatefulWidget {
  const HomeNavBarDoctor({super.key});
  static String id = 'HomeNavBarDoctor';
  @override
  State<HomeNavBarDoctor> createState() => _HomeNavBarDoctorState();
}

class _HomeNavBarDoctorState extends State<HomeNavBarDoctor> {
  int _currenIndex = 0;
  final List<Widget> listoption = <Widget>[
    const HomeDoctor(),
    const AddDoctor(),
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
