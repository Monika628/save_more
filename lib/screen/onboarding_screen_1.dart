import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Illustration Image
            Image.asset(
              'assets/illustration.png',
              width: 312,
              height: 312,
            ),
            const SizedBox(height: 50), // Adjusted spacing

            // Title Text
            const Text(
              'Gain total control of \nyour money',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                height: 1.2,
                letterSpacing: 0,
                color: Color(0xFF212325),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20), // Spacing between title and subtitle

            // Subtitle Text
            const Text(
              'Become your own money manager \nand make every cent count',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.0, // 100% line height
                letterSpacing: 0,
                color: Color(0xFF91919F), // Subtitle color
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 30), // Space before indicator

            // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFF7F3DFF), // Active Indicator Color
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDEAFF), // Inactive Indicator Color
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDEAFF), // Inactive Indicator Color
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            SizedBox(
              width: 343,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7F3DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Button radius
                  ),
                  padding: const EdgeInsets.all(8),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons

            // Secondary Button (Login with different color)
            SizedBox(
              width: 343,
              height: 56,
              child: OutlinedButton(
                onPressed: () {

                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: const BorderSide(color: Color(0xFFEEE5FF)), // Border color
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFEEE5FF), // Text color changed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


