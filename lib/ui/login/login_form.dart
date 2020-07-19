import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/utils/validator.dart';

class LoginForm extends StatefulWidget {
  final Function(String number) notifyParent;
  LoginForm({Key key, @required this.notifyParent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.phone,
              validator: phoneNumberValidator,
              onChanged: (value) => {phoneNumber = value},
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFDBE7DB),
                  hintText: 'Enter your phone number',
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
                        widget.notifyParent(phoneNumber);
                      }
                    },
                    color: Color(0XFF9378FF),
                    child: Text('Sign In',
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)))),
            SizedBox(height: 20),
            ButtonTheme(
                minWidth: 200,
                height: 50,
                child: RaisedButton(
                    onPressed: () {},
                    color: Color(0XFFE4DFFB),
                    child: Text('Business Login',
                        style: GoogleFonts.openSans(fontSize: 20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))))
          ],
        ));
  }
}
