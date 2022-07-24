
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgetFunctinos.dart';

class ProgressDialog extends StatelessWidget {
  final String displayMessage;

  const ProgressDialog({Key? key, required this.displayMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AvatarGlow(
        glowColor: Colors.orange[100]!,
        endRadius: 90.0,
        duration: const Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                ),
              ),
              addHorizontal(10),
              Container(
                child: Text(
                  displayMessage,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}