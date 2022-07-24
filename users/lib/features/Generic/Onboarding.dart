import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/components/widgetFunctinos.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingSlider(
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/l');
        },
        finishButtonColor: Colors.orangeAccent,
        finishButtonTextStyle: GoogleFonts.raleway(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        skipTextButton: Text(
          'Skip',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        controllerColor: Colors.orangeAccent,
        // trailing: Text('Login'),
        background: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 275,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 275,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 275,
            ),
          ),
        ],
        totalPage: 3,
        speed: 2,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                addVertical(480),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                addVertical(480),
                Text('Description Text 2'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                addVertical(480),
                Text('Description Text 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
