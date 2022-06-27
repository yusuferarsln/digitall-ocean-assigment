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

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-8.816020, 13.231920),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('marinelocation'.tr),
            InkWell(
              child: Icon(Icons.restore),
              onTap: () {
                _reset();
              },
            ),
          ],
        ),
        backgroundColor: palleteBlue.withOpacity(0.7),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GoogleMap(
        mapType: MapType.terrain,
        markers: {_angolaMarker},
        initialCameraPosition: _angola,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _backtoAngola,
        label: Text('backto'.tr + ' ' + 'Luanda,Angola'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _backtoAngola() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _reset() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_angola));
  }
}
