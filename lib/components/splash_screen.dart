import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/onboarding%20screen.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        
          splashIconSize: 250,
          backgroundColor: const Color(0xff1C2731),
          splash: const CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage(
                'assets/images/logo-removebg-preview-removebg-preview.png'),
          ),
          nextScreen: const ExplainScreens());
  }
}