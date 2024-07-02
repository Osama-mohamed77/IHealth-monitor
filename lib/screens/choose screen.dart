import 'package:flutter/material.dart';
import 'package:ihealth_monitor/screens/Doctor/sign%20in%20doctor.dart';
import 'package:ihealth_monitor/screens/Patient/Sign%20in%20Patient%20.dart';
import 'package:ihealth_monitor/screens/Shadow/Sign%20in%20shadow.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});
  static String id = 'ChooseScreen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getTextScale(double size) {
      return size * (screenWidth / 375); // 375 is a reference width
    }

    double getButtonHeight() {
      return screenHeight *
          0.07; // Button height as a percentage of screen height
    }

    double getButtonWidth() {
      return screenWidth * 0.55; // Button width as a percentage of screen width
    }

    double getGapHeight() {
      return screenHeight * 0.05; // Gap height as a percentage of screen height
    }

    return Scaffold(
      backgroundColor: const Color(0xff1C2731),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Who are you?',
                style: TextStyle(
                  fontFamily: 'alata',
                  fontSize: getTextScale(45), // Scaled font size
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: getGapHeight()), // Gap between title and buttons

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignInPatient.id);
                },
                child: Container(
                  height: getButtonHeight(),
                  width: getButtonWidth(),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff69B5B4),
                  ),
                  child: Center(
                    child: Text(
                      'Patient',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: getTextScale(40), // Scaled font size
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              SizedBox(height: getGapHeight()), // Space between buttons

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignInShadow.id);
                },
                child: Container(
                  height: getButtonHeight(),
                  width: getButtonWidth(),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffA9A360),
                  ),
                  child: Center(
                    child: Text(
                      'Shadow',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: getTextScale(40), // Scaled font size
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              SizedBox(height: getGapHeight()), // Space between buttons

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignIn.id);
                },
                child: Container(
                  height: getButtonHeight(),
                  width: getButtonWidth(),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff92B28F),
                  ),
                  child: Center(
                    child: Text(
                      'Doctor',
                      style: TextStyle(
                        fontFamily: 'alata',
                        fontSize: getTextScale(40), // Scaled font size
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
