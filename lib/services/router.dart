import 'package:auto_route/auto_route_annotations.dart';
import 'package:parkfinder/views/add_a_vehicle/add_a_vehicle.dart';
import 'package:parkfinder/views/add_payment_info/add_payment_info.dart';
import 'package:parkfinder/views/booking_details/booking_details.dart';
import 'package:parkfinder/views/first_launch_screen/first_launch_screen.dart';
import 'package:parkfinder/views/help/help.dart';
import 'package:parkfinder/views/legal/legal.dart';
import 'package:parkfinder/views/login/login.dart';
import 'package:parkfinder/views/main_feed/main_feed.dart';
import 'package:parkfinder/views/my_profile/my_profile.dart';
import 'package:parkfinder/views/parking_codes/parking_codes.dart';
import 'package:parkfinder/views/payment_pass/payment_pass.dart';
import 'package:parkfinder/views/pick_a_parking_spot/pick_a_parking_spot.dart';
import 'package:parkfinder/views/settings/settings_view.dart';
import 'package:parkfinder/views/sign_up/sign_up.dart';
import 'package:parkfinder/views/splash_screen/splash_screen.dart';

@autoRouter
class $Router {
  @initial
  SplashScreen splashScreen;
  AddACar addACar;
  AddPaymentInfo addPaymentInfo;
  BookingDetails bookingDetails;
  FirstLaunchScreen firstLaunchScreen;
  ParkingCodes parkingCodes;
  Help help;
  Legal legal;
  Myprofile myprofile;
  SettingsView settingsView;
  PickAParkingSpot pickAParkingSpot;
  MainFeed mainFeed;
  Login login;
  SignUp signUp;
  PaymentPass paymentPass;
}
