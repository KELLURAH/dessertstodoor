import 'package:flutter/material.dart';
import 'package:users/core/components/widgetFunctions.dart';

import '../../../../core/utils/Colors.dart';

class Vendors extends StatefulWidget {
  final String vendorName;
  final String vendorImage;
  final bool fromHomepage;

  const Vendors(
      {Key? key,
      required this.vendorName,
      required this.vendorImage,
      required this.fromHomepage})
      : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(
        false,
        title: widget.fromHomepage ? 'All Vendors' : widget.vendorName,
        backgroundColor: OFFERS_COLOR.withOpacity(0.45),
      ),
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          // padding: const EdgeInsets.only( left: 7, right: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.vendorImage),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                      ),
                    ),
                  ),
                ],
              ),
              addVertical(size.height * 0.0025),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: subText('text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
