// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:parkfinder/views/splash_screen/splash_screen.dart';
import 'package:parkfinder/views/add_a_vehicle/add_a_vehicle.dart';
import 'package:parkfinder/views/add_payment_info/add_payment_info.dart';
import 'package:parkfinder/views/booking_details/booking_details.dart';
import 'package:parkfinder/views/first_launch_screen/first_launch_screen.dart';
import 'package:parkfinder/views/parking_codes/parking_codes.dart';
import 'package:parkfinder/views/help/help.dart';
import 'package:parkfinder/views/legal/legal.dart';
import 'package:parkfinder/views/my_profile/my_profile.dart';
import 'package:parkfinder/views/settings/settings_view.dart';
import 'package:parkfinder/views/pick_a_parking_spot/pick_a_parking_spot.dart';
import 'package:parkfinder/views/main_feed/main_feed.dart';
import 'package:parkfinder/views/login/login.dart';
import 'package:parkfinder/views/sign_up/sign_up.dart';
import 'package:parkfinder/views/payment_pass/payment_pass.dart';

class Router {
  static const splashScreen = '/';
  static const addACar = '/add-aCar';
  static const addPaymentInfo = '/add-payment-info';
  static const bookingDetails = '/booking-details';
  static const firstLaunchScreen = '/first-launch-screen';
  static const parkingCodes = '/parking-codes';
  static const help = '/help';
  static const legal = '/legal';
  static const myprofile = '/myprofile';
  static const settingsView = '/settings-view';
  static const pickAParkingSpot = '/pick-aparking-spot';
  static const mainFeed = '/main-feed';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const paymentPass = '/payment-pass';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.splashScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => SplashScreen(key: typedArgs),
          settings: settings,
        );
      case Router.addACar:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AddACar(key: typedArgs),
          settings: settings,
        );
      case Router.addPaymentInfo:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AddPaymentInfo(key: typedArgs),
          settings: settings,
        );
      case Router.bookingDetails:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => BookingDetails(key: typedArgs),
          settings: settings,
        );
      case Router.firstLaunchScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => FirstLaunchScreen(key: typedArgs),
          settings: settings,
        );
      case Router.parkingCodes:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ParkingCodes(key: typedArgs),
          settings: settings,
        );
      case Router.help:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => Help(key: typedArgs),
          settings: settings,
        );
      case Router.legal:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => Legal(key: typedArgs),
          settings: settings,
        );
      case Router.myprofile:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => Myprofile(key: typedArgs),
          settings: settings,
        );
      case Router.settingsView:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => SettingsView(key: typedArgs),
          settings: settings,
        );
      case Router.pickAParkingSpot:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => PickAParkingSpot(key: typedArgs),
          settings: settings,
        );
      case Router.mainFeed:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => MainFeed(key: typedArgs),
          settings: settings,
        );
      case Router.login:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => Login(key: typedArgs),
          settings: settings,
        );
      case Router.signUp:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => SignUp(key: typedArgs),
          settings: settings,
        );
      case Router.paymentPass:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => PaymentPass(key: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
