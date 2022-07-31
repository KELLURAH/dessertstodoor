import 'package:flutter/material.dart';
import 'package:vendors/Generic/Splash.dart';

import 'Generic/Index.dart';
import 'Generic/Onboarding.dart';
import 'src/features/Authentication/presentation/pages/Login.dart';
import 'src/features/Authentication/presentation/pages/OtpVerify.dart';
import 'src/features/Authentication/presentation/pages/Registration.dart';
import 'src/features/LandingPage/presentation/pages/Homepage.dart';
import 'src/features/LandingPage/presentation/pages/Offers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/o': (context) => const OnBoarding(),
        '/r': (context) => const Registration(),
        '/otp': (context) => const OtpVerify(),
        '/l': (context) => const Login(),
        '/h': (context) => const Index(
              email: 'georonathan47@mail.com',
              name: 'Test Name',
            ),
        '/home': (context) => const HomePage(),
        '/offers': (context) => const OffersPage(),
      },
    );
  }
}
