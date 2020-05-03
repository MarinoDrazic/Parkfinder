import 'package:flutter/material.dart';
import 'package:parkfinder/provider/provider_setup.dart';
import 'package:parkfinder/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Hotel Klient',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          canvasColor: Colors.transparent,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
