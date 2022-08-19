import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/components/widgetFunctions.dart';
import '../core/utils/Colors.dart';

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
      const Duration(seconds: 5),
      // ? Implement check when integration is done!
      () => Navigator.pushReplacementNamed(context, '/o'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Material(
      child: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarGlow(
                  glowColor: PRIMARY_COLOR.withOpacity(0.35),
                  endRadius: 175,
                  repeat: true,
                  showTwoGlows: true,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: deviceSize.height * 0.5,
                    width: deviceSize.width,
                  ),
                ),
                addVertical(deviceSize.height * 0.125),
                Column(
                  children: [
                    Text(
                      'Desserts to Door',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    addVertical(deviceSize.height * 0.0125),
                    Text(
                      'VENDOR',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
