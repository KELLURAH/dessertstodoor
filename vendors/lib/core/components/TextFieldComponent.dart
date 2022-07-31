import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Colors.dart';

TextFormField TextFieldComponent(
  TextEditingController controller,
  String labelText,
  String hintText,
  bool isPassword,
  bool isEmail,
  bool isPhone,
) {
  return TextFormField(
    decoration: InputDecoration(
      constraints: const BoxConstraints(
        maxHeight: 57,
        maxWidth: 500,
      ),
      labelText: labelText,
      prefixIcon: isPassword
          ? const Icon(Icons.lock_outline, color: WHITE_COLOR)
          : (isEmail
              ? const Icon(Icons.email_outlined, color: WHITE_COLOR)
              : (isPhone
                  ? const Icon(Icons.phone_outlined, color: WHITE_COLOR)
                  : const Icon(Icons.person_outline, color: WHITE_COLOR))),
      labelStyle: GoogleFonts.poppins(
        fontSize: 16,
        color: WHITE_COLOR,
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        fontSize: 14,
        color: WHITE_COLOR,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: WHITE_COLOR,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF72F8AE),
          width: 2.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    ),
    obscureText: isPassword ? true : false,
  );
}
