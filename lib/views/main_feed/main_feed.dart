import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkfinder/views/main_feed/main_feed_viewmodel.dart';
import 'package:provider/provider.dart';

class MainFeed extends StatefulWidget {
  MainFeed({Key key}) : super(key: key);

  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.512319, 16.460914),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MainFeedViewmodel>.value(
        value: MainFeedViewmodel(),
        child: Consumer<MainFeedViewmodel>(
          builder: (context, model, child) {
            if (model.markers.isEmpty) {
              model.getLocation(context);
              model.getMarkers(context);
            }
            return Stack(
              children: <Widget>[
                GoogleMap(
                    mapType: MapType.normal,
                    markers: model.markers,
                    polylines: model.polyLines,
                    initialCameraPosition: model.splitLocation()),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 40),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.search),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search Location'),
                                )),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Icon(
                            Icons.settings,
                            color: Colors.indigo,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
