import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users/core/utils/Colors.dart';

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
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    ),
    actions: isHome
        ? [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
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
  Color color,
) {
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
      fillColor: Colors.grey[300],
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
    },
    // onEditingComplete: () {
    //   if (emailController.text.isNotEmpty &&
    //       passwordController.text.isNotEmpty) {
    //     setState(() {
    //       isFilled = true;
    //     });
    //   }
    // },
  );
}

Text normalText(String? text) {
  return Text(
    text!,
    style: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );
}
