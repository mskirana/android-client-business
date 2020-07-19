import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_page.dart';
import 'package:mskirana_app/ui/login/login_page.dart';

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/': (BuildContext context) => new HomePage()
};
