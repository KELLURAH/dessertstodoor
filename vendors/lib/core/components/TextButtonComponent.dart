// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonComponent extends StatelessWidget {
  final String? label;
  final Function? onTap;
  Color? labelColor = Colors.teal.shade300;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final double? offSetX;
  final double? offSetY;
  final double? spreadRadius;
  final double? blurRadius;
  final Color? shadowColor;

  TextButtonComponent({
    @required this.label,
    @required this.onTap,
    this.labelColor,
    this.fontSize,
    this.borderRadius,
    this.boxShadow,
    this.offSetX,
    this.offSetY,
    this.spreadRadius,
    this.blurRadius,
    this.shadowColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                color: labelColor ?? Colors.pink,
                borderRadius: BorderRadius.circular(
                  borderRadius ?? 20,
                ),
                boxShadow: [
                  BoxShadow(
                    offset:
                        Offset(offSetX ?? 0.2, offSetY != null ? offSetX! : 0.2),
                    blurRadius: blurRadius ?? 0.2,
                    spreadRadius: spreadRadius ?? 0.2,
                    color: shadowColor ?? Colors.black12,
                  ),
                ],
              ),
              child: Text(
                label!,
                style: GoogleFonts.lato(
                  fontSize: fontSize ?? 21,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
