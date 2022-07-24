import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:users/core/utils/Colors.dart';
import 'package:users/features/LandingPage/presentation/pages/Offers.dart';

import '../../core/components/ProgressDialog.dart';
import '../../core/utils/UtilityService.dart';
import '../LandingPage/presentation/pages/Homepage.dart';
import '../LandingPage/presentation/pages/LandingPage.dart';

class Index extends StatefulWidget {
  final String name;
  final String email;
  const Index({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 1;
  int activeIndex = 1;

  Future<bool> showExitPopUp() async {
    UtilityService().confirmationBox(
      title: 'Quit Application',
      message: 'Are you sure you want to exit application?',
      context: context,
      yesButtonColor: Colors.teal,
      noButtonColor: Colors.red,
      onYes: () async {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return const ProgressDialog(
              displayMessage: 'Exiting application...',
            );
          },
        );
        return true;
      },
      onNo: () {
        Navigator.pop(context);
        return false;
      },
    );
    return false;
  }

  void _onTap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      backgroundColor: BACKGROUND_COLOR,
      body: navigator(_selectedIndex),
    );
  }

  Widget? navigator(int index) {
    // Provider.of<AppData>(context, listen: false).updateUserData(customer);
    if (index == 0) {
      return LandingPage(email: widget.email, name: widget.name);
    } else if (index == 1) {
      return const HomePage();
    } else if (index == 2) {
      //   return const PharmacistsPage();
      return const OffersPage();
      // } else if (index == 3) {
      //   return const SettingsScreen();
      // } else if (index == 4) {
      //   return const AccountScreen();
    } else {
      return null;
      //   return const PrescriptionsPage();
      // }
    }
  }

  SalomonBottomBar buildBottomNavigationBar() {
    return SalomonBottomBar(
      currentIndex: _selectedIndex,
      onTap: (i) => setState(() => _selectedIndex = i),
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.dashboard),
          title: Text('Dashboard'.toUpperCase()),
          selectedColor: PRIMARY_COLOR,
        ),

        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: Text('Home'.toUpperCase()),
          selectedColor: SECOND_COLOR,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.discount),
          title: Text('Vendors'.toUpperCase()),
          selectedColor: OFFERS_COLOR,
        ),

        /// Search
        // SalomonBottomBarItem(
        //   icon: const Icon(Icons.search),
        //   title: Text('Search'.toUpperCase()),
        //   selectedColor: Colors.orange,
        // ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.menu_rounded),
          title: Text('Menu'.toUpperCase()),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }
}
