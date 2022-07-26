import 'package:flutter/material.dart';
import 'package:users/core/components/widgetFunctions.dart';

import '../../../../core/utils/Colors.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        false,
        title: 'All Vendors',
        backgroundColor: OFFERS_COLOR.withOpacity(0.45),
      ),
      body: Center(
        child: Text('Vendors'),
      ),
    );
  }
}
