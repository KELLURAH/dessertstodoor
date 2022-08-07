import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/core/components/widgetFunctions.dart';
import 'package:vendors/core/utils/Colors.dart';

class DashboardCards extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final double? fontSize;
  final Color? backgroundColor;
  final Widget? icon;
  const DashboardCards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.image,
    this.backgroundColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width * 0.4,
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      decoration: BoxDecoration(
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
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: subTextRaleway(subtitle, fontSize: 55),
            ),
            addVertical(10),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title!,
                style: GoogleFonts.poppins(
                  fontSize: fontSize ?? 18,
                  letterSpacing: .5,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    height: size.height * 0.065,
                    width: size.width * 0.125,
                    decoration: BoxDecoration(
                      color: SECOND_COLOR.withOpacity(0.15),
                      border: Border.all(
                        color: SECOND_COLOR,
                        width: 2,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(17.5)),
                    ),
                    child: icon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
