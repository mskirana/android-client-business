import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/utils/validator.dart';

class OtpForm extends StatelessWidget {
  final String phoneNumber;
  final _formKey = GlobalKey<FormState>();

  OtpForm(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Enter the OTP sent to " + phoneNumber,
          style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.phone,
                validator: otpValidator,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFDBE7DB),
                    hintText: 'Enter the OTP',
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(0.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
              ),
              SizedBox(height: 20),
              ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                      onPressed: () {
                        // if phone number is valid, notify parent!
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                      },
                      color: Color(0XFF9378FF),
                      child: Text('Sign In',
                          style: GoogleFonts.openSans(
                              color: Colors.white, fontSize: 20)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)))),
            ],
          ))
    ]);
  }
}
