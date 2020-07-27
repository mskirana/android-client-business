import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDiscountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.openSans(fontSize: 16, color: Color(0XFF99879D)),
            children: <TextSpan>[
          TextSpan(
              text:
                  "Showing stores near your address - Microsoft Signature Bldg,... Bengaluru 560071. "),
          TextSpan(
              text: "Change?",
              style: TextStyle(decoration: TextDecoration.underline))
        ]));
  }
}
