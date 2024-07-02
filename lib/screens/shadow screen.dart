import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShadowExplain extends StatelessWidget {
  const ShadowExplain({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scale text sizes based on screen width
    double getTextScale(double size) {
      return size * (screenWidth / 375); // 375 is a reference width
    }

    return Scaffold(
      backgroundColor: const Color(0xff1C2731),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(40),
            Center(
              child: Image.asset(
                'assets/images/شادو-removebg-preview.png',
                height: screenHeight *
                    0.3, // Adjust image height based on screen height
                width: screenWidth *
                    0.8, // Adjust image width based on screen width
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
                height: screenHeight * 0.05), // Gap between image and title
            Text(
              'Shadow!',
              style: TextStyle(
                fontSize: getTextScale(35), // Scaled font size
                fontFamily: 'alata',
                color: Colors.white,
              ),
            ),
            SizedBox(
                height:
                    screenHeight * 0.03), // Gap between title and description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
              child: Text(
                textAlign: TextAlign.center,
                'IHealth monitor will allow you to follow up your patient and send you alerts if medications are not taken on time or measurements are not entered.',
                style: TextStyle(
                  fontSize: getTextScale(16), // Scaled font size
                  fontFamily: 'alata',
                  color: const Color(0xff7C8894),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.2), // Space at the bottom
          ],
        ),
      ),
    );
  }
}
