import 'package:flutter/material.dart';
import 'package:vendors/core/components/widgetFunctions.dart';
import 'package:vendors/core/utils/Colors.dart';

class PayMethods extends StatefulWidget {
  const PayMethods({Key? key}) : super(key: key);

  @override
  State<PayMethods> createState() => _PayMethodsState();
}

class _PayMethodsState extends State<PayMethods> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'Payment Methods',
        context: context,
      ),
      body: screenBody(
        size: size,
        children: [
          subTextRaleway('Choose only one method'),
          Container(
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 3),
                  spreadRadius: 1.5,
                  blurRadius: 2.25,
                  blurStyle: BlurStyle.outer,
                )
              ],

            ),
          ),
        ],
      ),
    );
  }
}
