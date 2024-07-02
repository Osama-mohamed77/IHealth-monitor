import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PatientExplain extends StatelessWidget {
  const PatientExplain({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        children: [
          SizedBox(
              height: screenHeight * 0.1), // Top margin with Spacer equivalent
          Center(
            child: Image.asset(
              'assets/images/مريض2-removebg-preview.png',
              height: screenHeight *
                  0.3, // Adjust image height based on screen height
              width:
                  screenWidth * 0.8, // Adjust image width based on screen width
              fit: BoxFit
                  .cover, // Ensure image covers the container appropriately
            ),
          ),
          SizedBox(height: screenHeight * 0.05), // Gap between image and title
          Center(
            child: Text(
              'Patient!',
              style: TextStyle(
                fontSize: getTextScale(35), // Scaled font size
                fontFamily: 'alata',
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
              height: screenHeight * 0.02), // Gap between title and description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              textAlign: TextAlign.center,
              'IHealth monitor will allow you to follow your doctor at all times, record your readings, remind you of appointments, and you can even allow another person to monitor your condition.',
              style: TextStyle(
                fontSize: getTextScale(16), // Scaled font size
                fontFamily: 'alata',
                color: const Color(0xff7C8894),
              ),
            ),
          ),
          SizedBox(
              height:
                  screenHeight * 0.2), // Bottom margin with Spacer equivalent
        ],
      ),
    );
  }
}
