import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors/src/features/Authentication/presentation/pages/Login.dart';

import '../../../../../core/components/widgetFunctions.dart';
import '../../../../../core/utils/Colors.dart';

class Payouts extends StatefulWidget {
  const Payouts({Key? key}) : super(key: key);

  @override
  State<Payouts> createState() => PayoutsState();
}

class PayoutsState extends State<Payouts> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.25,
        title: Text(
          'Payouts',
          style: GoogleFonts.poppins(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: screenBody(
        size: size,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subText('Wallet Activities'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(color: Colors.black54, thickness: 0.45),
              ),
              PaymentInfoSettings(size, '0201154679'),
              addVertical(size.height * 0.075),
              subText('Recent Withdrawals'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(color: Colors.black54, thickness: 0.45),
              ),
              RecentWithdrawals(size),
            ],
          ),
        ],
      ),
    );
  }

  Container RecentWithdrawals(Size size) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
      height: size.height * 0.35,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        height: 250,
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          // color: Colors.white,
        ),
        child: DataTable2(
          columnSpacing: 10,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: subText('Date', fontWeight: FontWeight.w600),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: subText('Customer Name', fontWeight: FontWeight.w600),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: subText('Amount Withdrawn', fontWeight: FontWeight.w600),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: subText('Balance', fontWeight: FontWeight.w600),
              size: ColumnSize.M,
            ),
          ],
          rows: List<DataRow>.generate(
            5,
            (index) => DataRow(
              cells: [
                DataCell(Text(DateTime(2022, 8, 17).toString())),
                DataCell(
                  subTextRaleway(
                    'B' * (10 - (index + 5) % 10),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                DataCell(
                  subTextRaleway(
                      'GH¢ ${double.parse('3750').toStringAsFixed(2)}'),
                ),
                DataCell(
                  subTextRaleway(
                      'GH¢ ${double.parse('13750').toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container PaymentInfoSettings(Size size, String phone) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: size.width,
      height: size.height * .265,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          // ? Wallet
          ListTile(
            leading: const Icon(Icons.wallet, color: SECOND_COLOR),
            title: subText('WALLET BALANCE', fontSize: 14),
            trailing: subTextRaleway('GH¢ 4,000', fontSize: 16),
            onTap: null,
          ),

          ListTile(
            // trailing: const Icon(Icons.navigate_next, size: 30),
            leading: Image.asset('assets/images/transaction.png', height: 25),
            trailing: subTextRaleway('Coming soon', fontSize: 14),
            title: subText(
              'See Transactions',
              fontSize: deviceWidth >= 400 ? 14 : 16,
            ),
            onTap: null,
            // tileColor: SECOND_COLOR,
          ),

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
}
