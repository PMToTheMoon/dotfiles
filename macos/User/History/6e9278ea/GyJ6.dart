import 'package:flutter/material.dart';

import 'package:common/common.dart';
import '/splash/splash.dart';

import '/login/login.dart';
import '/sign_in/sign_in.dart';

import '/home/home.dart';
import '/address_selection/address_selection.dart';
import '/payment/payment.dart';

import '/trip_list/trip_list.dart';
import '/trip_details/trip_details.dart';

import '/profile/profile.dart';
import '/passengers/passengers.dart';
import '/payment_methods/payment_methods.dart';

import '/external_pages/external_pages.dart';

const initialRoute = SplashPage.route;
// const initialRoute = "/ui_kit";

final routes = <String, Widget Function(BuildContext)>{
  //TODO: remove
  "/ui_kit": (BuildContext context) => const UiKitPage(),

  // Auth
  SplashPage.route: SplashPage.builder,
  LoginPage.route: LoginPage.builder,
  SignInPage.route: SignInPage.builder,

  // Reservation
  HomePage.route: HomePage.builder,
  TrainNumberSelectionPage.route: TrainNumberSelectionPage.builder,
  PaymentPage.route: PaymentPage.builder,

  // Trip List
  TripListPage.route: TripListPage.builder,
  TripDetailsPage.route: TripDetailsPage.builder,

  //Profile
  ProfilePage.route: ProfilePage.builder,
  PaymentMethodsPage.route: PaymentMethodsPage.builder,

  // Passenger
  PassengersPage.route: PassengersPage.builder,
  NewPassengerPage.route: NewPassengerPage.builder,

  //EXTERNAL
  SupportPage.route: SupportPage.builder,
  LegalMentionsPage.route: LegalMentionsPage.builder,
  MeetPointsPage.route: MeetPointsPage.builder,
  TermsOfUsePage.route: TermsOfUsePage.builder,
  ReportProblemPage.route: ReportProblemPage.builder,
};
