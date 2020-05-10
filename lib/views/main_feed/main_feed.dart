import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkfinder/views/drawer/inner_drawer.dart';
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
  GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();
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
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff4568DC), Color(0xffB06AB3)])),
              child: InnerDrawer(
                key: _innerDrawerKey,
                backgroundColor: Colors.transparent,
                onTapClose: true, // default false
                swipe: false,

                scale: IDOffset.horizontal(
                    0.8), // set the offset in both directions

                proportionalChildArea: true, // default true
                borderRadius: 50, // default 0
                leftChild: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage("assets/profile.png"),
                                  ),
                                  Spacer(flex: 1),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 150),
                                    child: Text(
                                      "Kanye West",
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        buildDrawerItem(Icons.portrait, "My Profile"),
                        buildDrawerItem(Icons.credit_card, "Payment Pass"),
                        buildDrawerItem(Icons.help, "Help"),
                        buildDrawerItem(Icons.settings, "Settings"),
                        buildDrawerItem(Icons.bookmark_border, "Payment Pass"),
                      ],
                    ),
                  ),
                ),

                leftAnimationType: InnerDrawerAnimation.quadratic,
                scaffold: Stack(
                  children: <Widget>[
                    GoogleMap(
                        mapType: MapType.normal,
                        markers: model.markers,
                        polylines: model.polyLines,
                        initialCameraPosition: model.splitLocation()),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _innerDrawerKey.currentState.toggle(
                                // direction is optional
                                // if not set, the last direction will be used
                                //InnerDrawerDirection.start OR InnerDrawerDirection.end
                                direction: InnerDrawerDirection.start);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 40),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(9),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.indigo,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding buildDrawerItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.indigo,
                ),
              ),
              Spacer(flex: 1),
              Text(
                text,
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
