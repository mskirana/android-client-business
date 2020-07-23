import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_page.dart';
import 'package:mskirana_app/ui/login/login_page.dart';
import 'package:mskirana_app/ui/order/order_page.dart';

final routes = {
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage(),
  '/order': (BuildContext context) => new OrderPage(),
  
};
