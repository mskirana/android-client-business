import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/login/login_bottom_app_bar.dart';
import 'package:mskirana_app/ui/login/login_masthead.dart';
import 'package:mskirana_app/ui/login/login_form.dart';
import 'package:mskirana_app/ui/login/login_otp_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String phoneNumber = "";

  setPhoneNumber(String number) {
    setState(() {
      phoneNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: LoginBottomAppBar(),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            LoginMastHead(),
            Padding(
                padding: const EdgeInsets.all(40),
                child: (phoneNumber?.isEmpty ?? true)
                    ? LoginForm(notifyParent: setPhoneNumber)
                    : OtpForm(phoneNumber ?? ""))
          ])),
    );
  }
}
