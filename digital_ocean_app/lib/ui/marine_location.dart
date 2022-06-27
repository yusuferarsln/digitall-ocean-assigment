import 'dart:async';

import 'package:flutter/material.dart';
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
      infoWindow: InfoWindow(title: 'Luanda,Angola'),
      icon: BitmapDescriptor.defaultMarkerWithHue(20),
      position: LatLng(-8.816020, 13.231920));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Marine Location')),
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
        label: Text('Back to Luanda,Angola'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _backtoAngola() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_angola));
  }
}
