// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/core/utils/Colors.dart';

import '../../../../../core/components/loading.dart';
import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/UtilityService.dart';

class Login extends StatefulWidget {
  // final Function toggleView;
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final AuthService _auth = AuthService();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  String error = '';
  bool isAPIcall = false;
  bool isFilled = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final resetPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Loading(
      isAsyncCall: isAPIcall,
      opacity: 0.75,
      child: uiBuild(context),
    );
  }

  Widget uiBuild(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: ClipRRect(
            child: Details(screenWidth),
          ),
        ),
      ),
    );
  }

  Container Details(double screenWidth) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        // image: DecorationImage(
        //   image: SvgPicture.asset('assets/svgs/sign_in.png', scale: 2.0),
        // ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 1,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SvgPicture.asset('assets/svgs/sign_in.svg'),
          ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormDetails(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Form FormDetails(Size size) {
    return Form(
      key: _formkey,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          // primarySwatch: Colors.amber,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.white54,
              fontSize: 20.0,
            ),
          ),
          // textTheme: screenWidth < 500 ? smallScreen : largeScreen,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 95,
                  ),
                  addVertical(10),
                  Text(
                    'Login to Dessert2Door!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      letterSpacing: .75,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            addVertical(size.height * 0.035),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  buildFormField(
                    'Eg. 020-1234-567',
                    'Phone Number',
                    emailController,
                    true,
                    false,
                    (val) {
                      return val.isEmpty ? 'Username is required' : null;
                    },
                  ),
                  addVertical(size.height * 0.025),
                  buildFormField(
                    '***************',
                    'Password',
                    passwordController,
                    false,
                    true,
                    (val) {
                      return val.isEmpty
                          ? 'This is a required field and cannot be empty'
                          : val.length < 6
                              ? 'Password must be at least 6 characters long'
                              : null;
                    },
                  ),
                  addVertical(size.height * 0.025),
                  TextButton(
                    onPressed: () {
                      resetPassword(size);
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .25,
                      ),
                    ),
                  ),
                  addVertical(size.height * 0.010),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  addVertical(size.height * 0.025),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: GREEN_COLOR[400],
                      ),
                      onPressed: onButtonPressed,
                      child: SizedBox(
                        height: size.height * 0.055,
                        width: size.width * 0.55,
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                letterSpacing: 2.2,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVertical(size.height * 0.010),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          letterSpacing: .25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/r');
                        },
                        child: Text(
                          'REGISTER',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            letterSpacing: .5,
                            color: SECOND_COLOR,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVertical(size.height * 0.010),
                  Text(
                    error,
                    style: GoogleFonts.poppins(
                      color: Colors.red[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> resetPassword(Size size) {
    return showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Dialog(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: size.height * 0.35,
              width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      letterSpacing: .75,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addVertical(size.height * 0.010),
                  Text(
                    'Enter your email address to reset your password',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      letterSpacing: .25,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVertical(size.height * 0.020),
                  buildFormField(
                    'Eg. 020-1234-567',
                    'Phone Number',
                    resetPhone,
                    true,
                    false,
                    (val) {
                      setState(() {
                        resetPhone.text = val;
                      });
                      return val.isEmpty ? 'Username is required' : null;
                    },
                  ),
                  addVertical(size.height * 0.025),
                  SizedBox(
                    height: size.height * 0.055,
                    width: size.width * 0.55,
                    child: ElevatedButton(
                      onPressed: onReset,
                      style: ElevatedButton.styleFrom(
                        primary: GREEN_COLOR[400],
                      ),
                      child: Text(
                        'Reset',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          letterSpacing: .45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onReset() {
    // validateAndSave();
    if (resetPhone.text.isEmpty) {
      UtilityService().showMessage(
        context: context,
        message: 'Phone Number field cannot be empty...',
        isSuccess: false,
      );
    } else if (resetPhone.text.length > 10 || resetPhone.text.length < 10) {
      UtilityService().showMessage(
        context: context,
        message: 'Phone Number must be 10 digits...',
        isSuccess: false,
      );
    } else {
      Navigator.pop(context);
      UtilityService().showPrompt(
        context: context,
        message: 'An OTP has been sent to ${resetPhone.text}',
      );
    }
  }

  void onButtonPressed() async {
    // signIn();
    if (validateAndSave()) {
      setState(() {
        isAPIcall = true;
      });

      var data = {
        'username': emailController.text,
        'password': passwordController.text,
      };
      setState(() {
        isAPIcall = false;
      });
      Navigator.pushReplacementNamed(context, '/h');
      // var res = await PhamarxAPI().authData(data, LOGIN_URL);
      // var body = json.decode(res.body);
      // if (res.statusCode == 200) {
      //   HelperFunctions.saveUserName(emailController.text);
      //   HelperFunctions.saveUserLoggedInState(true);

      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Index(
      //         name: body['username'],
      //         email: body['email'],
      //       ),
      //     ),
      //   );
      //   setState(() {
      //     isAPIcall = false;
      //   });
      //   UtilityService().showMessage(
      //     isSuccess: true,
      //     context: context,
      //     message: '${emailController.text} has successfully logged in!',
      //     icon: Icon(Icons.check_box, color: Colors.teal[400]),
      //   );
      // } else {
      //   UtilityService().showMessage(
      //     isSuccess: false,
      //     context: context,
      //     message: body['detail'][0],
      //     icon: Icon(Icons.error, color: Colors.red[400]),
      //   );
      //   Navigator.pop(context);
      // }
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      // if (passwordController.text == confirmPasswordController.text) {
      form.save();
      // }
      return true;
    } else {
      return false;
    }
  }

  TextFormField buildFormField(
    String hint,
    String label,
    TextEditingController controller,
    bool isPhone,
    bool isPassword,
    formvalidator,
  ) {
    return TextFormField(
      validator: formvalidator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: .5,
          ),
        ),
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        prefixIcon: isPhone
            ? const Icon(Icons.phone_outlined)
            : const Icon(Icons.password_outlined),
        fillColor: Colors.white70,
        filled: true,
        focusColor: Colors.orangeAccent,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black54, width: 1.5),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red[400]!, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black54, width: 1.5),
        ),
      ),
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      onChanged: isPhone
          ? (val) {
              emailController.text = val;
            }
          : (isPassword)
              ? (val) {
                  passwordController.text = val;
                }
              : (val) {
                  resetPhone.text = val;
                },
      onEditingComplete: () {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          setState(() {
            isFilled = true;
          });
        }
      },
      obscureText: !isPhone ? true : false,
    );
  }
}
