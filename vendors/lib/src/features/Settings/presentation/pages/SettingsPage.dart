import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:vendors/src/features/Authentication/presentation/pages/ProfilePage.dart';
import '../../../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';
import '../../../../../core/utils/Path.dart';
// import '../../../../../core/utils/UtilityService.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

const accountHolder = 'B. Foster Bakery';
const phone = '0201154679';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        // backgroundColor: Colors.white,
        // elevation: 0.25,
        title: 'Settings',
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
            // color: BACKGROUND_COLOR,
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? User Accounts Session
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.15),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: const Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AvatarGlow(
                          glowColor: PRIMARY_COLOR,
                          endRadius: 40.0,
                          duration: const Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
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
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                letterSpacing: .35,
                                fontSize: 14,
                              ),
                            ),
                            addVertical(10),
                            Text(
                              accountHolder,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                letterSpacing: .75,
                                fontSize: 16,
                              ),
                            ),
                            addVertical(10),
                            Row(
                              children: [
                                subText('Current Balance: ', fontSize: 14),
                                subTextRaleway(
                                  'GH¢ 4,000.00',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              addVertical(20),

              Text(
                'Payment Info',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .5,
                  // color: Colors.black45,
                ),
              ),
              const Divider(thickness: .45),
              addVertical(10),
              PaymentInfoSettings(size, phone),

              addVertical(20),
              Text(
                'Shop Info',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .5,
                ),
              ),
              const Divider(thickness: .45),
              addVertical(10),
              ShopInfo(size, phone),

              addVertical(20),
              Text(
                'Vendor Account Settings',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .5,
                  // color: Colors.black45,
                ),
              ),
              const Divider(thickness: .45),
              addVertical(10),
              // UserAccountSettings(size, phone),
              UserAccountsInfo(size, phone),

              addVertical(20),
              // Center(
              //   child: Text(
              //     'Version: $VERSION',
              //     style: GoogleFonts.poppins(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container PaymentInfoSettings(Size size, String phone) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: size.width,
      height: size.height * .3,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     // color: Colors.grey.withOpacity(0.15),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 5), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        children: [
          // ? Wallet
          ListTile(
            leading: const Icon(Icons.wallet, color: SECOND_COLOR),
            title: subText('WALLET BALANCE'),
            trailing: subText('GH¢ 4,000', fontSize: 14),
            onTap: null,
          ),

          ListTile(
            trailing: const Icon(Icons.navigate_next, size: 30),
            leading: Image.asset('assets/images/transaction.png', height: 25),
            title: subText('See Transactions', fontSize: 17),
            onTap: null,
            // tileColor: SECOND_COLOR,
          ),

          // ? FAQs
          // ListTile(
          //   trailing: const Icon(Icons.navigate_next_outlined, size: 30),
          //   leading: const Icon(
          //     Icons.credit_card_outlined,
          //     color: PRIMARY_COLOR,
          //   ),
          //   title: subText('Payment Methods', fontSize: 17),
          //   onTap: () => Navigator.pushNamed(context, '/pay_meth'),
          //   // tileColor: SECOND_COLOR,
          // ),
          ListTile(
            trailing: const Icon(Icons.navigate_next_outlined, size: 30),
            leading: const Icon(
              Icons.monetization_on_outlined,
              color: Colors.green,
            ),
            title: subText('Withdraw Funds', fontSize: 17),
            onTap: () => Navigator.pushNamed(context, '/wFunds'),
            // tileColor: SECOND_COLOR,
          ),
        ],
      ),
    );
  }

  Container UserAccountsInfo(Size size, String phone) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: size.width,
      height: size.height * .3,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.15),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 5), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        children: [
          // ? Wallet
          ListTile(
            leading: const Icon(Icons.person_outline, color: SECOND_COLOR),
            title: subText('Profile Settings'),
            trailing: const Icon(Icons.navigate_next_rounded, size: 30),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),

          ListTile(
            trailing: subText('v$VERSION'),
            leading: Image.asset('assets/images/about.png', height: 25),
            title: subText('About App'),
            onTap: null,
          ),

          ListTile(
            leading: const Icon(
              Icons.phone_in_talk_outlined,
              color: Colors.green,
            ),
            title: subText('Talk to Us'),
            onTap: () async => _makePhoneCall(phone),
            // tileColor: SECOND_COLOR,
          ),
        ],
      ),
    );
  }

  Container ShopInfo(Size size, String phone) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      width: size.width,
      height: size.height * .3125,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.15),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],
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
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
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
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
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
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
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
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
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
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                  ),
                ),
              ],
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
