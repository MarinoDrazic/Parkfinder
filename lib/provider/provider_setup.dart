import 'package:parkfinder/services/api.dart';
import 'package:parkfinder/services/firebase_auth.dart';
import 'package:parkfinder/services/firestore_service.dart';
import 'package:parkfinder/services/location_service.dart';
import 'package:parkfinder/services/marker_creator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Api()),
  Provider.value(value: LocationService()),
  Provider.value(value: MarkerCreator()),
  Provider.value(value: FirebaseAuthenticationService()),
  Provider.value(value: FirestoreService()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
