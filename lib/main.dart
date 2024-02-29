// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/components/splash_screen.dart';
import 'package:ihealth_monitor/firebase_options.dart';
import 'package:ihealth_monitor/screens/Home.dart';
import 'package:ihealth_monitor/screens/choose%20screen.dart';
import 'package:ihealth_monitor/screens/forget%20password.dart';
import 'package:ihealth_monitor/screens/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/sign%20up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const IHealthMonitor());
}

class IHealthMonitor extends StatefulWidget {
  const IHealthMonitor({super.key});

  @override
  State<IHealthMonitor> createState() => _IHealthMonitorState();
}

class _IHealthMonitorState extends State<IHealthMonitor> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('----------------------User is currently signed out!');
      } else {
        print('----------------------User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ChooseScreen.id: (context) => const ChooseScreen(),
          signIn.id: (context) => const signIn(),
          signUp.id: (context) => const signUp(),
          HomeDoctor.id: (context) => const HomeDoctor(),
          forgetPassword.id: (context) => const forgetPassword()
        },
        home: const SplashScreen());
  }
}
