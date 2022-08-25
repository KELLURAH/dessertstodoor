import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';

class OffersCards extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;
  final double? fontSize;
  final Color? backgroundColor;
  final Widget? icon;
  const OffersCards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.icon,
    this.backgroundColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width * 0.4,
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.darken,
        borderRadius: BorderRadius.circular(35),
        color: SECOND_COLOR,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          // color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(image!),
            ),
            addVertical(10),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title!,
                style: GoogleFonts.poppins(
                  fontSize: fontSize ?? 18,
                  letterSpacing: .5,
                  // color: WHITE_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersCard extends OffersCards {
  final String? header;
  final String? value;
  // final String? image;
  const OrdersCard({
    Key? key,
    required super.title,
    required super.subtitle,
    required super.image,
    required this.header,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image!),
      title: subTextRaleway(
        title,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: .75,
      ),
      subtitle: subTextRaleway(subtitle, fontWeight: FontWeight.w500),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            subTextRaleway(header, fontWeight: FontWeight.w400),
            addVertical(3),
            subText(value, fontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
