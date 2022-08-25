import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/core/utils/Colors.dart';

import '../../../../../../core/components/widgetFunctions.dart';

class RidersPage extends StatefulWidget {
  const RidersPage({Key? key}) : super(key: key);

  @override
  State<RidersPage> createState() => _RidersPageState();
}

class _RidersPageState extends State<RidersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.25,
        title: Text(
          'Riders',
          style: GoogleFonts.poppins(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Theme(
        data: ThemeData.light(),
        child: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 75),
                  decoration: const BoxDecoration(
                    // color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: subText(
                    'There are currently no riders available.'
                    'Please try again later.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
