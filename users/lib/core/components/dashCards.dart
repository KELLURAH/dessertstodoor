import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/components/widgetFunctinos.dart';
import 'package:users/core/utils/Colors.dart';

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
      height: size.height * 0.3,
      width: size.width * 0.3,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
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
          Container(
            height: size.height * 0.125,
            width: size.width,
            decoration: const BoxDecoration(
              // color: color ?? Colors.teal[300],
              // gradient: LinearGradient(
              //   begin: Alignment.centerRight,
              //   end: Alignment.centerLeft,
              //   colors: [
              //     gradientColor1 ?? PHARM_GREEN_GRADIENT1,
              //     gradientColor2 ?? PHARM_GREEN_GRADIENT2,
              //   ],
              // ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Image.asset(image, fit: BoxFit.cover, scale: .5,),
          ),
          addVertical(10),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                letterSpacing: .5,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
