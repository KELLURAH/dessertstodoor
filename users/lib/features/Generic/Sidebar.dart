import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';

import '../Authentication/presentation/pages/ProfilePage.dart';

Widget Sidebar({BuildContext? context, String? email, String? name}) {
  return Drawer(
    elevation: 0.25,
    child: Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: PRIMARY_COLOR.withOpacity(0.2)),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[400],
                child: Image.asset('assets/images/logo.png', height: 70),
              ),
              accountName: Text(
                'Hello, $name!',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .25,
                ),
              ),
              accountEmail: Text(
                email!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: .5,
                child: ListTile(
                  leading: const Icon(
                    Icons.person_outline_outlined,
                    // color: SECOND_COLOR,
                  ),
                  title: Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pop(context!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(name: name!, email: email),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                // color: WARNING.shade100,
                elevation: .5,
                child: ListTile(
                  leading: Image.asset('assets/images/bell.png', height: 25),
                  title: Text(
                    'Notifications',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pop(context!);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Notifications(),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                // color: LABEL_COLOR,
                elevation: .5,
                child: ListTile(
                  leading: Image.asset('assets/images/discount.png', height: 30),
                  title: Text(
                    'Promo Codes',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context!);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SettingsPage(),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                // color: LABEL_COLOR,
                elevation: .5,
                child: ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context!);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SettingsPage(),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: .5,
                child: ListTile(
                  leading: Image.asset('assets/images/faq.png', height: 30),
                  title: Text(
                    'FAQs',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context!);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const FAQsPage(),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: .5,
                child: ListTile(
                  leading: Image.asset('assets/images/logout.png', height: 30),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .45,
                    ),
                  ),
                  onTap: () => logout(context!),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          // top: 720,
          bottom: 10,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Version: v1.0.0',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

logout(BuildContext context) async {
  // var res = await PhamarxAPI().logout(LOGOUT_URL);
  // var body = json.decode(res.body);

  // print(body);
  Navigator.pop(context);
  // ? Clear User session and logout

  Navigator.pushReplacementNamed(context, '/l');
}
