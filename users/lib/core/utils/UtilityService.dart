import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/widgetFunctions.dart';
import 'Colors.dart';

class UtilityService {
  void showMessage(
      {String? message, Icon? icon, BuildContext? context, bool? isSuccess}) {
    showFlash(
      context: context!,
      duration: const Duration(seconds: 5),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.bottom,
          backgroundColor: isSuccess! ? GREEN_COLOR[100]! : Colors.pink[100]!,
          child: FlashBar(
            icon: icon,
            message: Text(
              message!,
              style: GoogleFonts.raleway(
                color: Colors.black54,
                letterSpacing: .3,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            ),
          ),
        );
      },
    );
  }

  void showPrompt({String? message, Icon? icon, BuildContext? context}) {
    showFlash(
      context: context!,
      duration: const Duration(seconds: 5),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            icon: icon,
            message: Text(
              message!,
              style: GoogleFonts.raleway(color: Colors.black54),
              maxLines: 2,
            ),
          ),
        );
      },
    );
  }

  Future<bool?> successMessage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext? context) {
        return AlertDialog(
          title: Text('Done'),
          content: Text('Add Success'),
          actions: <Widget>[
            OutlinedButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context!);
              },
            ),
          ],
        );
      },
    );
  }

  void successMessageButton({
    String? title,
    String? message,
    BuildContext? context,
    Function? proceed,
    Color? color,
    buttonText,
    Color? textColor,
    Color? backgroundColor,
  }) {
    showDialog(
        context: context!,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 400,
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title!,
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      addVertical(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          //alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              message!,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                wordSpacing: 0.8,
                                fontWeight: FontWeight.w400,
                                color: textColor ?? Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVertical(15),
                      GestureDetector(
                        onTap: () => proceed,
                        child: Container(
                          height: 40,
                          width: 184,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.4, 0.5),
                                spreadRadius: 0.2,
                                blurRadius: 0.2,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style: GoogleFonts.lato(
                                decoration: TextDecoration.none,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void notificationMessageWithButton({
    String? title,
    String? message,
    BuildContext? context,
    Function? proceed,
    Color? color,
    buttonText,
    Color? textColor,
    Color? backgroundColor,
  }) {
    showDialog(
      context: context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 220,
                width: 400,
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.5, 0.5),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          title!,
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    addVertical(30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        //alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            message!,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              wordSpacing: 0.8,
                              fontWeight: FontWeight.w400,
                              color: textColor ?? Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVertical(15),
                    GestureDetector(
                      onTap: () => proceed,
                      child: Container(
                        height: 40,
                        width: 184,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.4, 0.5),
                              spreadRadius: 0.2,
                              blurRadius: 0.2,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            buttonText,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void confirmationBox({
    String? title,
    String? message,
    BuildContext? context,
    Function? onYes,
    Function? onNo,
    Color? yesButtonColor,
    Color? noButtonColor,
    String? buttonLabel,
    double? buttonHeight,
    double? buttonWidth,
  }) {
    showDialog(
        context: context!,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title!,
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      addVertical(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          //alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              message!,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                wordSpacing: 1,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      addVertical(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => onYes,
                            child: Container(
                              height: buttonHeight ?? 35,
                              width: buttonWidth ?? 64,
                              decoration: BoxDecoration(
                                color: yesButtonColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.4, 0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.2,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  buttonLabel ?? 'Yes',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => onNo,
                            child: Container(
                              height: 35,
                              width: 64,
                              decoration: BoxDecoration(
                                color: noButtonColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0.4, 0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.2,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void singleButtonConfirmation({
    String? title,
    String? message,
    BuildContext? context,
    Function? onYes,
    Color? color,
    String? buttonLabel,
    double? buttonHeight,
    double? buttonWidth,
  }) {
    showDialog(
      context: context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 220,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.5, 0.5),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          title!,
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    addVertical(30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        //alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            message!,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    addVertical(12),
                    Center(
                      child: GestureDetector(
                        onTap: () =>onYes,
                        child: Container(
                          height: buttonHeight ?? 35,
                          width: buttonWidth ?? 64,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.4, 0.5),
                                spreadRadius: 0.2,
                                blurRadius: 0.2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              buttonLabel ?? 'Yes',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void messageContent({
    String? title,
    String? message,
    BuildContext? context,
    Function? onYes,
    Color? color,
    String? buttonLabel,
    double? buttonHeight,
    double? buttonWidth,
  }) {
    showDialog(
      context: context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(
                        0.5,
                        0.5,
                      ),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        //alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            message!,
                            style: GoogleFonts.lato(
                              fontSize: 16.3,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
