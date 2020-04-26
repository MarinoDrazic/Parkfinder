import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkfinder/views/main_feed/main_feed_bottom_sheet.dart';

class MarkerCreator {
  Function clearPolylinesCallback;
  Future<Set<Marker>> getMarkers(BuildContext context, Function showPolyline,
      Function clearPolylines) async {
    clearPolylinesCallback = clearPolylines;
    Set<Marker> markers = new Set<Marker>();

    BitmapDescriptor free = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/freemarker.png');
    BitmapDescriptor full = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/fullmarker.png');

    //copy paste boys
    //this is how real programers do it!
    //where is my clean code award
    markers.add(Marker(
        markerId: MarkerId("Marker1"),
        position: LatLng(43.517641, 16.443580),
        infoWindow: InfoWindow(
          title: 'Sukoišan',
          snippet: '20 Empty spaces',
        ),
        icon: free,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker1"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker2"),
        position: LatLng(43.516121, 16.440652),
        infoWindow: InfoWindow(
          title: 'City parking',
          snippet: '10 Empty spaces',
        ),
        icon: free,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker2"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker3"),
        position: LatLng(43.512917, 16.437828),
        infoWindow: InfoWindow(
          title: 'Split parking',
          snippet: '3 Empty spaces',
        ),
        icon: free,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker3"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker4"),
        position: LatLng(43.509068, 16.443246),
        infoWindow: InfoWindow(
          title: 'City Parking',
          snippet: 'Full',
        ),
        icon: full,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker4"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker5"),
        position: LatLng(43.512319, 16.460914),
        infoWindow: InfoWindow(
          title: 'City Parking',
          snippet: 'Full',
        ),
        icon: full,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker5"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker6"),
        position: LatLng(43.507069, 16.440265),
        infoWindow: InfoWindow(
          title: 'City Parking',
          snippet: 'Full',
        ),
        icon: full,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker6"));
        }));
    markers.add(Marker(
        markerId: MarkerId("Marker7"),
        position: LatLng(43.507984, 16.435888),
        infoWindow: InfoWindow(
          title: 'City Parking',
          snippet: 'Full',
        ),
        icon: full,
        onTap: () {
          showBottomSheet(context);
          showPolyline(MarkerId("Marker7"));
        }));

    return markers;
  }

  void showBottomSheet(BuildContext context) {
    Future<void> modalFuture = showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => MainFeedBottomSheet());
    modalFuture.then((void value) => clearPolylinesCallback());
  }
}
