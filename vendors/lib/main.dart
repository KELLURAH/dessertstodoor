import 'package:flutter/material.dart';
import 'package:vendors/Generic/Splash.dart';

import 'Generic/Index.dart';
import 'Generic/Onboarding.dart';
import 'src/Authentication/presentation/pages/Login.dart';
import 'src/Authentication/presentation/pages/Registration.dart';
import 'src/LandingPage/presentation/pages/Homepage.dart';
import 'src/LandingPage/presentation/pages/Offers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/o': (context) => const OnBoarding(),
        '/r': (context) => const Registration(),
        '/l': (context) => const Login(),
        '/h': (context) => const Index(
              email: 'georonathan47@mail.com',
              name: 'Test Name',
            ),
        // '/vendors': (context) => const Vendors(
        //       vendorImage: 'assets/images/cupcake.png',
        //       vendorName: 'Tom\'s Bakery',
        //       fromHomepage: false,
        //     ),
        '/home': (context) => const HomePage(),
        '/offers': (context) => const OffersPage(),
      },
    );
  }
}
