import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vendors/core/utils/Colors.dart';

import '../../../../../../core/components/widgetFunctions.dart';

class RidersPage extends StatefulWidget {
  const RidersPage({Key? key}) : super(key: key);

  @override
  State<RidersPage> createState() => _RidersPageState();
}

class _RidersPageState extends State<RidersPage> {
  static const CameraPosition koforidua = CameraPosition(
    target: LatLng(6.078443, -0.271394),
    zoom: 16,
  );
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.25,
        title: Text(
          'Riders',
          style: GoogleFonts.poppins(
            // color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            initialCameraPosition: koforidua,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.satellite,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.25,
              width: size.width,
              margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Available Riders -',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      addHorizontal(5),
                      Text(
                        '0',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  addVertical(size.height * 0.075),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
