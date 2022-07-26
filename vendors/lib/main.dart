import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:vendors/Generic/Splash.dart';
import 'package:vendors/core/utils/Colors.dart';
import 'package:vendors/src/features/Authentication/presentation/pages/ProfilePage.dart';
import 'package:vendors/src/features/Settings/presentation/pages/WithdrawFunds.dart';
import 'package:vendors/src/features/Settings/presentation/widgets/PaymentMethods.dart';

import 'Generic/Index.dart';
import 'Generic/Onboarding.dart';
import 'src/features/Authentication/presentation/pages/Login.dart';
import 'src/features/Authentication/presentation/pages/OtpVerify.dart';
import 'src/features/Authentication/presentation/pages/Registration.dart';
import 'src/features/LandingPage/presentation/pages/Offers.dart';
import 'src/features/Settings/presentation/pages/Notifications.dart';
import 'src/features/Settings/presentation/pages/SettingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: FlexColorScheme.light(
        colors: lightMode,
        useMaterial3ErrorColors: true,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        colors: lightMode.toDark(),
        useMaterial3ErrorColors: true,
      ).toTheme,
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
        // '/home': (context) => const HomePage(),
        '/offers': (context) => const OffersPage(),
        '/profile': (context) => const ProfilePage(
              email: 'georonathan47@mail.com',
              name: 'Test Name',
            ),
        '/wFunds': (context) => const WFundsPage(),
        '/pay_meth': (context) => const PayMethods(),
        '/notifications': (context) => const NoticiationsPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
