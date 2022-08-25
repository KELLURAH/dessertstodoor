import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/components/widgetFunctions.dart';
import '../core/utils/Colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: OnBoardingSlider(
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/r');
        },
        finishButtonColor: SECOND_COLOR,
        finishButtonTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          // color: Colors.white,
        ),
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        skipTextButton: Image.asset('assets/images/skip.png', height: 30),
        // skipTextButton: Text(
        //   'Skip',
        //   style: GoogleFonts.poppins(
        //     fontSize: 20,
        //     fontWeight: FontWeight.w600,
        //     // color: Colors.black,
        //   ),
        // ),
        controllerColor: SECOND_COLOR,
        // trailing: Text('Login'),
        background: [
          Container(),
          Container(),
          Container(),
          Container(),
        ],
        totalPage: 4,
        speed: 2,
        pageBodies: [
          OnboardingDetails(
            'assets/svgs/welcome.svg',
            size: size,
            title: '👋🏾 Welcome to Desserts to Door',
            description:
                'Your one in all shop for all your pastry needs...\nOrder your favourite pastries!',
          ),
          OnboardingDetails(
            'assets/svgs/order.svg',
            size: size,
            title: 'Order your favourite pastry!',
            description: 'Order pastries from your favourite vendors!',
          ),
          OnboardingDetails(
            'assets/svgs/delivered.svg',
            size: size,
            title: 'Get your ordered pastry in no time!',
            description:
                'Once your order has been processed, a rider is dispatched to deliver your pastry at your designated location. 📍',
          ),
          OnboardingDetails(
            'assets/svgs/register.svg',
            size: size,
            title: 'Register today! 🥳🎉',
            description: '...and get access to all these and much more!\n🥳🎉',
          ),
        ],
      ),
    );
  }
}
