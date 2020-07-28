import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_page.dart';
import 'package:mskirana_app/ui/login/login_page.dart';
import 'package:mskirana_app/ui/order/order_page.dart';
import 'package:mskirana_app/ui/payment/payment_page.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_page.dart';
import 'package:mskirana_app/ui/tracking/track_main/track_page.dart';

final routes = {
  '/payment': (BuildContext context) => new PaymentPage(),
  '/account': (BuildContext context) => HomePage(),
  '/trackOrder': (BuildContext context) =>
      TrackOrderPage(ModalRoute.of(context).settings.arguments),
  '/tracking': (BuildContext context) => TrackPage(),
  '/order': (BuildContext context) => new OrderPage(),
  '/home': (BuildContext context) => HomePage(),
  '/': (BuildContext context) => LoginPage()
};
