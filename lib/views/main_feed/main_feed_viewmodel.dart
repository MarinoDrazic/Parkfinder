import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:parkfinder/services/location_service.dart';
import 'package:parkfinder/services/marker_creator.dart';
import 'package:parkfinder/views/main_feed/main_feed_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MainFeedViewmodel extends ChangeNotifier {
  MainFeedViewmodel();
  Set<Marker> markers = new Set<Marker>();
  Set<Polyline> polyLines = new Set<Polyline>();
  static const radnomString = "AIzaSyBb0wWzTyAlWkJcPd_JvunFwHxIW-Rj5og";

  CameraPosition splitLocation() {
    return CameraPosition(
      target: LatLng(43.512319, 16.460914),
      zoom: 14.4746,
    );
  }

  int counter = 0;
  Future<void> getLocation(BuildContext context) async {
    LocationService _locationService = Provider.of<LocationService>(context);
    bool locationGranted = await _locationService.getLocationWithChecks();

    if (locationGranted) {
      LocationData location = await _locationService.location.getLocation();

      markers.add(Marker(
          markerId: MarkerId("User"),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: 'My Location',
            snippet: 'Im here!',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta),
          onTap: () {
            showBottomSheet(context, MarkerId("User"));
          }));
    }
    notifyListeners();
    _locationService.location.onLocationChanged
        .listen((LocationData currentLocation) {
      markers
          .removeWhere((element) => element.infoWindow.title == 'My Location');
      markers.add(Marker(
          markerId: MarkerId("User"),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(
            title: 'My Location',
            snippet: 'Im here!',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta),
          onTap: () {
            showBottomSheet(context, MarkerId("User"));
          }));
      counter++;
      notifyListeners();
    });
  }

  Future<void> getMarkers(BuildContext context) async {
    MarkerCreator markerCreator = Provider.of<MarkerCreator>(context);
    Set<Marker> markers = await markerCreator.getMarkers(
        context, this.setPolylines, this.clearPolyLines);
    this.markers.addAll(markers);
  }

  void showBottomSheet(BuildContext context, MarkerId marker) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => MainFeedBottomSheet());
  }

  setPolylines(MarkerId markerId) async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];
    Marker currentLocation = markers
        .where((element) => element.infoWindow.title == 'My Location')
        .first;
    Marker selectedLocation =
        markers.where((element) => element.markerId == markerId).first;
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        radnomString,
        currentLocation.position.latitude,
        currentLocation.position.longitude,
        selectedLocation.position.latitude,
        selectedLocation.position.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    // create a Polyline instance
    // with an id, an RGB color and the list of LatLng pairs
    Polyline polyline = Polyline(
        polylineId: PolylineId("MainPoly"),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates);

    // add the constructed polyline as a set of points
    // to the polyline set, which will eventually
    // end up showing up on the map
    polyLines.clear();
    polyLines.add(polyline);
  }

  void clearPolyLines() {
    polyLines.clear();
  }
}
