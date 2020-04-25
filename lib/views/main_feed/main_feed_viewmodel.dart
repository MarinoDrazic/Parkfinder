import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainFeedViewmodel extends ChangeNotifier {
  MainFeedViewmodel();

  CameraPosition splitLocation() {
    return CameraPosition(
      target: LatLng(43.512319, 16.460914),
      zoom: 14.4746,
    );
  }

  Set<Marker> getMarkers() {
    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(
      markerId: MarkerId(DateTime.now().millisecondsSinceEpoch.toString()),
      position: LatLng(43.512319, 16.460914),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    return markers;
  }

  void getData() {}
}
