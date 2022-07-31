import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../core/utils/Path.dart';
import '../../../../../core/utils/UtilityService.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  bool isChecked = false;
  final Duration _duration = const Duration(milliseconds: 370);
  Animation<Alignment>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const phone = '0201154679';
    const accountHolder = 'David Bateson';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.25,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: BACKGROUND_COLOR,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ? User Accounts Session
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AvatarGlow(
                        glowColor: PRIMARY_COLOR,
                        endRadius: 50.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(.8),
                              radius: 25,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      addHorizontal(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This account belongs to:',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              letterSpacing: .35,
                              fontSize: 14,
                            ),
                          ),
                          addVertical(10),
                          Text(
                            accountHolder,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              letterSpacing: .75,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            addVertical(20),
            Text(
              'User Account Settings',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                color: Colors.black45,
              ),
            ),
            const Divider(thickness: .45, color: Colors.black54),
            addVertical(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              width: size.width,
              height: size.height * .3125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // ? About Us
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const Profile(
                        //       name: accountHolder,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile Settings',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(Icons.navigate_next, size: 30)
                        ],
                      ),
                    ),
                    addVertical(15),
                    // ? FAQs
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FAQs',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(Icons.navigate_next, size: 30),
                        ],
                      ),
                    ),
                    addVertical(15),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About App',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Version $VERSION',
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                    addVertical(15),
                    GestureDetector(
                      onTap: () {
                        _makePhoneCall(phone);
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Talk to Us',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .5,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(Icons.phone_in_talk, size: 30),
                          ],
                        ),
                      ),
                    ),
                    addVertical(15),
                    // ? Contact Us
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Theme',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(
                              () {
                                if (_animationController!.isCompleted) {
                                  _animationController!.reverse();
                                } else {
                                  _animationController!.forward();
                                }
                                isChecked = !isChecked;
                              },
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 25,
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                            decoration: BoxDecoration(
                              color: isChecked ? Colors.green : Colors.grey,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(99),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: isChecked
                                      ? Colors.green.withOpacity(0.6)
                                      : Colors.grey.withOpacity(0.6),
                                  blurRadius: 15,
                                  offset: Offset(0, 8),
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: _animation!.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (_animationController!
                                              .isCompleted) {
                                            _animationController!.reverse();
                                          } else {
                                            _animationController!.forward();
                                          }
                                          isChecked = !isChecked;
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            addVertical(20),
            Text(
              'User Session',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: .5,
                color: Colors.red[300],
              ),
            ),
            const Divider(thickness: .45, color: Colors.black54),
            addVertical(10),
            GestureDetector(
              onTap: () {
                UtilityService().confirmationBox(
                  // greenButton: 'No',
                  // redButton: 'Yes',
                  title: 'Logout?',
                  message:
                      'Logging out will clear any unsaved data and the current user session.\nAre you sure you want to log out?',
                  context: context,
                  onNo: () {},
                  onYes: () => Navigator.pop(context),
                  yesButtonColor: Colors.teal[300],
                  noButtonColor: Colors.red[300],
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 75,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.exit_to_app_outlined, size: 25),
                    addHorizontal(20),
                    Text(
                      'Logout',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                        color: Colors.black,
                      ),
                    ),
                    addHorizontal(MediaQuery.of(context).size.width * .45),
                    const Icon(Icons.exit_to_app, size: 30),
                  ],
                ),
              ),
            ),
            addVertical(20),
            Center(
              child: Text(
                'Version: $VERSION',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
