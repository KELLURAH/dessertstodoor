import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../../core/components/TextButtonComponent.dart';
import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../core/utils/UtilityService.dart';
import '../../data/models/UserModel.dart';

class OtpVerify extends StatefulWidget {
  // final UserModel? otpModel;
  const OtpVerify({Key? key /*, this.otpModel*/}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState(/*otpModel: otpModel!*/);
}

class _OtpVerifyState extends State<OtpVerify> {
  // final UserModel otpModel;
  String? globalPin;
  String caption =
      'Enter the verification code we just sent to your email address.';

  // @override
  // void initState() {
  //   super.initState();
  //   if (otpModel.email != null) {
  //     caption =
  //         'Enter the verification code we just sent to your email address '
  //         '${otpModel.email!.substring(0, 1)}'
  //         '***${otpModel.email!.substring(otpModel.email!.length - 3)}';
  //   }
  // }

  // _OtpVerifyState({required this.otpModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterButtons: [
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            //   child: TextButtonComponent(
            //     labelColor: PRIMARY_COLOR,
            //     label: 'Verify',
            //     onTap: () {
            //       Navigator.pushNamed(context, '/h');
            //       // bool canRegister = isValidInput(context);
            //       // if (canRegister == true) {
            //       //   registerUser(context: context, otpModel: otpModel);
            //     },
            //   ),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/h'),
              style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
              child: Text(
                'VERIFY',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  letterSpacing: .35,
                  color: WHITE_COLOR,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/r');
                    },
                    child: Container(
                      child: const Icon(
                        Icons.navigate_before,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'OTP Verification',
                    style: GoogleFonts.lato(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                ),
              ),
              addVertical(30),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/verifyotp.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
              addVertical(14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter the verification code we',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              addVertical(7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'just sent to your phone',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              addVertical(7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'number.',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              addVertical(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 50,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      print('Completed: $pin');
                      setState(() {
                        globalPin = (pin);
                        print('globalPin: $globalPin');
                      });
                    },
                    // obscureText: true,
                    onChanged: (pin) {
                      globalPin = (pin);
                      print('globalPin: $globalPin');
                    },
                  ),
                ),
              ),
              addVertical(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "🤔 Didn't receive the code?",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  addHorizontal(5),
                  GestureDetector(
                    onTap: () {
                      print('resend');
                    },
                    child: Container(
                      child: Text(
                        'Resend',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                    ),
                  ),
                  addHorizontal(10),
                ],
              ),
              addVertical(10),
              // SizedBox(
              //   width: size.width,
              //   height: size.height * 0.1,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              //     //   child: TextButtonComponent(
              //     //     labelColor: PRIMARY_COLOR,
              //     //     label: 'Verify',
              //     //     onTap: () {
              //     //       Navigator.pushNamed(context, '/h');
              //     //       // bool canRegister = isValidInput(context);
              //     //       // if (canRegister == true) {
              //     //       //   registerUser(context: context, otpModel: otpModel);
              //     //     },
              //     //   ),
              //     child: ElevatedButton(
              //       onPressed: () => Navigator.pushNamed(context, '/h'),
              //       child: Text(
              //         'VERIFY',
              //         style: GoogleFonts.poppins(
              //           fontSize: 18,
              //           letterSpacing: .3,
              //           color: WHITE_COLOR,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // bool isValidInput(BuildContext context) {
  //   if (globalPin == null) {
  //     UtilityService().showMessage(
  //         message: 'Please enter pin',
  //         context: context,
  //         icon: const Icon(
  //           Icons.error_outline,
  //           color: Colors.red,
  //         ));
  //     return false;
  //   } else if (globalPin != otpModel.pin.toString()) {
  //     UtilityService().showMessage(
  //         message: 'Invalid pin',
  //         context: context,
  //         icon: const Icon(
  //           Icons.error_outline,
  //           color: Colors.red,
  //         ));
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
  //
  // void registerUser({UserModel otpModel, BuildContext context}) async {
  //   try {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return ProgressDialog(displayMessage: 'Please wait...');
  //       },
  //     );
  //     debugPrint("Print here");
  //     debugPrint("$otpModel");
  //     var jsonBody = jsonEncode(otpModel);
  //     NetworkUtility networkUtility = NetworkUtility();
  //     Response response = await networkUtility.postDataWithAuth(
  //         url: OTP_VERIFICATION, body: jsonBody, auth: 'Bearer $ACCESS_TOKEN');
  //     debugPrint(response.body);
  //
  //     Navigator.of(context, rootNavigator: true).pop();
  //     UtilityService().showMessage(
  //       context: context,
  //       message: 'Your registration was successful',
  //       icon: const Icon(
  //         Icons.check_circle_rounded,
  //         color: Colors.lightGreenAccent,
  //       ),
  //     );
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => Index(userModel: otpModel)));
  //   } catch (e) {
  //     print('postUserData error: $e');
  //     UtilityService().showMessage(
  //       context: context,
  //       message: 'An error has occurred. Please try again',
  //       icon: const Icon(
  //         Icons.error_outline,
  //         color: Colors.red,
  //       ),
  //     );
  //     Navigator.of(context, rootNavigator: true).pop();
  //   }
  // }
}
