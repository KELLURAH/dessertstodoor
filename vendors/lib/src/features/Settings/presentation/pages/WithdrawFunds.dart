import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:vendors/core/components/widgetFunctions.dart';

import '../widgets/WithdrawalStepper.dart';

class WFundsPage extends StatefulWidget {
  const WFundsPage({Key? key}) : super(key: key);

  @override
  State<WFundsPage> createState() => _WFundsPageState();
}

class _WFundsPageState extends State<WFundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.navigate_before,
              size: 35,
              // color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          );
        }),
        elevation: 0.25,
        title: Text(
          'Withdraw Funds',
          style: GoogleFonts.poppins(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                  onPressed: () => Navigator.pop(context),
                  child: subText('Cancel', color: Colors.red),
                ),
              ),
              addHorizontal(10),
              Expanded(
                child: ElevatedButton(
                  onPressed: null,
                  child: subText('Proceed'),
                ),
              ),
            ],
          ),
        ),
      ],
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: MediaQuery.of(context).size.height,
          // child:
          child: SingleChildScrollView(
            child: Column(
              children: [
                subText(
                  'Complete the steps below to withdraw your money...',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                const Divider(color: Colors.black54, thickness: .45),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: const Card(
                    child: WithdrawalStepper(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
