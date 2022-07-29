import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/core/utils/Colors.dart';

SizedBox addVertical(double height) {
  return SizedBox(height: height);
}

SizedBox addHorizontal(double width) {
  return SizedBox(width: width);
}

AppBar appbar(bool isHome, {String? title, Color? backgroundColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.white,
    leading: null,
    elevation: 0.25,
    title: Text(
      title!,
      style: GoogleFonts.poppins(
        color: isHome ? Colors.black : Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
    actions: isHome
        ? [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ]
        : null,
  );
}

TextFormField buildTextFormField(
  String hint,
  String label,
  TextEditingController controller,
  bool isSearch,
  Color color, {
  Function? onChanged,
}) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          letterSpacing: .5,
        ),
      ),
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      border: InputBorder.none,
      prefixIcon: const Icon(Icons.search, color: Colors.black87),
      suffixIcon: isSearch
          ? IconButton(
              icon: Image.asset('assets/images/filter.png'),
              onPressed: () {},
            )
          : null,
      fillColor: Colors.grey[100],
      filled: true,
      focusColor: PRIMARY_LIGHT,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color, width: 1.5),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.red[400]!, width: 1.5),
      ),
    ),
    keyboardType: TextInputType.text,
    onChanged: (val) {
      controller.text = val;
      onChanged;
    },
    onEditingComplete: () {},
  );
}

Text normalText(String? text) {
  return Text(
    text!,
    style: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      letterSpacing: .25,
    ),
  );
}

Text subText(String? text, {Color? color, double? fontSize}) {
  return Text(
    text!,
    style: GoogleFonts.poppins(
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
      letterSpacing: .25,
    ),
  );
}

SizedBox OnboardingDetails(
  String image, {
  Size? size,
  String? title,
  String? description,
}) {
  return SizedBox(
    height: size!.height,
    // padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [
        SizedBox(
          height: size.height * 0.65,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            addVertical(size.height * 0.025),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                description!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
