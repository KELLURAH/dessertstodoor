import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';

import '../../../../core/components/widgetFunctions.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Sidebar(),
      appBar: appbar(
        false,
        title: 'Vendors & Offers',
        backgroundColor: OFFERS_COLOR,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
