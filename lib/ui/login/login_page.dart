import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('English    |',
                        style: GoogleFonts.openSans(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(
                      '    Hindi',
                      style: GoogleFonts.openSans(color: Colors.grey),
                    )
                  ],
                ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/logo.jpg')),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                child: Column(
                  children: <Widget>[
                    Text(
                        'Support your local general stores and order your supplies instantly.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(20),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
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
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                children: <Widget>[
                  ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: RaisedButton(
                          onPressed: () {},
                          color: Color(0XFF9378FF),
                          child: Text('Sign In',
                              style: GoogleFonts.openSans(
                                  color: Colors.white, fontSize: 20)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)))),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 20)),
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
              ),
            )
          ],
        ));
  }
}
