import 'package:flutter/material.dart';

class DoctorExplain extends StatelessWidget {
  const DoctorExplain({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scale text sizes based on screen size
    double getTextScale(double size) {
      return size * (screenWidth / 375); // 375 is a common reference width
    }

    return Scaffold(
      backgroundColor: const Color(0xff1C2731),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        children: [
          SizedBox(height: screenHeight * 0.15), // Top margin
          Center(
            child: Image.asset(
              'assets/images/doctor.png',
              height: screenHeight *
                  0.3, // Adjust image height based on screen height
              width:
                  screenWidth * 0.7, // Adjust image width based on screen width
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Gap between image and text
          Center(
            child: Text(
              'Doctor!',
              style: TextStyle(
                fontSize: getTextScale(35), // Scaled font size
                fontFamily: 'alata',
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
              height: screenHeight * 0.02), // Gap between title and description
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'IHealth monitor will simplify your workflow, Enhancing communication and raising the level of patient care.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getTextScale(16), // Scaled font size
                  fontFamily: 'alata',
                  color: const Color(0xff7C8894),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.1), // Bottom margin
        ],
      ),
    );
  }
}
