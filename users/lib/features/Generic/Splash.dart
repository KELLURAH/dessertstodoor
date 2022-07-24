import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/features/Generic/Onboarding.dart';
// import 'package:potbellyriderv2/pages/auth/login_screen.dart';
// import 'package:potbellyriderv2/theme/theme_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  // const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  // return StartState()

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(ThemeImages.splashBg),
        //     colorFilter: const ColorFilter.mode(
        //       Color(0xfff6940d),
        //       BlendMode.softLight,
        //     ),
        //   ),
        // ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  // height: deviceSize.height * 0.5,
                  width: deviceSize.width * 0.5,
                ),
                const SizedBox(height: 8),
                Text(
                  'Desserts2Door',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // const CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
