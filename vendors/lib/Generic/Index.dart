// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vendors/core/utils/Colors.dart';
import 'package:vendors/src/features/LandingPage/presentation/pages/Cashout.dart';

import '../../core/components/ProgressDialog.dart';
import '../../core/utils/UtilityService.dart';
import '../src/features/LandingPage/presentation/pages/LandingPage.dart';
import '../src/features/LandingPage/presentation/pages/Offers.dart';
import '../src/features/LandingPage/presentation/pages/RidersPage.dart';

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
  int _selectedIndex = 0;
  int activeIndex = 0;

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
    if (index == 0) {
      return LandingPage(email: widget.email, name: widget.name);
    } else if (index == 1) {
      return const RidersPage();
    } else if (index == 2) {
    } else if (index == 3) {
      return const OffersPage();
    } else {
      return const Payouts();
    }
  }

  showModal() {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      elevation: 1.25,
      builder: (context) {
        return Container(
          color: Colors.black,
          height: size.height * 0.5,
          width: size.width * 0.5,
          child: Dialog(
            child: Container(),
          ),
        );
      },
    );
  }

  SalomonBottomBar buildBottomNavigationBar() {
    return SalomonBottomBar(
      currentIndex: _selectedIndex,
      onTap: (i) => setState(() => _selectedIndex = i),
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.dashboard),
          title: Text(
            'Dashboard'.toUpperCase(),
            style: GoogleFonts.raleway(fontSize: 10),
          ),
          selectedColor: PRIMARY_COLOR,
        ),

        /// Riders
        SalomonBottomBarItem(
          icon: const Icon(Icons.motorcycle_outlined),
          title: Text(
            'Riders'.toUpperCase(),
            style: GoogleFonts.raleway(fontSize: 12, color: Colors.blue),
          ),
          // selectedColor: Colors.blueGrey,
        ),

        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.add),
          title: Text(
            'Add'.toUpperCase(),
            style: GoogleFonts.raleway(fontSize: 10),
          ),
          selectedColor: Colors.teal,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Image.asset('assets/images/order.png', height: 30),
          title: Text(
            'Orders'.toUpperCase(),
            style: GoogleFonts.raleway(fontSize: 12),
          ),
          selectedColor: OFFERS_COLOR,
        ),

        /// Settings
        SalomonBottomBarItem(
          icon: const Icon(Icons.payments_outlined),
          title: Text(
            'Payouts'.toUpperCase(),
            style: GoogleFonts.raleway(fontSize: 10),
          ),
          selectedColor: Colors.black,
        ),

        /// Profile
        // SalomonBottomBarItem(
        //   icon: const Icon(Icons.menu_rounded),
        //   title: Text('Menu'.toUpperCase()),
        //   selectedColor: Colors.teal,
        // ),
      ],
    );
  }
}
