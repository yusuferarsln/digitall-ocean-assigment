import 'dart:async';

import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarineLocation extends StatefulWidget {
  @override
  State<MarineLocation> createState() => MarineLocationState();
}

class MarineLocationState extends State<MarineLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _angola = CameraPosition(
    target: LatLng(-8.816020, 13.231920),
    zoom: 15,
  );

  static final Marker _angolaMarker = Marker(
      markerId: MarkerId('_angolaMarker'),
      infoWindow: InfoWindow(
        title: 'Luanda,Angola',
      ),
      visible: true,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(-8.816020, 13.231920));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {_angolaMarker},
        initialCameraPosition: _angola,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _backtoAngola,
        label: Text('backto'.tr + ' ' + 'Angola'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _backtoAngola() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_angola));
  }
}
