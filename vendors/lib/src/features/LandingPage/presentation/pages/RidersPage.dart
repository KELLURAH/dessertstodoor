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
  static const CameraPosition _DCS = CameraPosition(
    target: LatLng(5.646446, -0.155072),
    zoom: 18,
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
      body: screenBody(
        children: [
          SizedBox(
            height: size.height * 0.65,
            child: GoogleMap(
              markers: _markers,
              initialCameraPosition: _DCS,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.satellite,
              zoomGesturesEnabled: false,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
        size: size,
      ),
    );
  }
}
