import 'package:parkfinder/services/api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
