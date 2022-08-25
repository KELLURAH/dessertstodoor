import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:vendors/core/components/widgetFunctions.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;
  const ProfileCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.325,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                letterSpacing: .5,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
