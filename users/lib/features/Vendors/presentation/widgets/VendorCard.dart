import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';

class VendorCard extends StatelessWidget {
  final String title, image;
  final bool isOffersPage;
  const VendorCard({
    Key? key,
    required this.title,
    required this.image,
    required this.isOffersPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: isOffersPage ? OFFERS_COLOR.withOpacity(0.05) : SECOND_COLOR.withOpacity(0.045),
        borderRadius: BorderRadius.circular(25),
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
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            filterQuality: FilterQuality.high,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.45),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
