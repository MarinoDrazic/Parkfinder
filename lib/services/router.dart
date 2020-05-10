import 'package:auto_route/auto_route_annotations.dart';
import 'package:parkfinder/views/add_a_vehicle/add_a_vehicle.dart';
import 'package:parkfinder/views/splash_screen/splash_screen.dart';

@autoRouter
class $Router {
  @initial
  SplashScreen splashScreen;
  AddACar addACar;
}
