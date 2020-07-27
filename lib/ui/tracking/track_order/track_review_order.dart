import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_header.dart';

class TrackReviewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TrackOrderHeader("assets/edit.png", "Please review the order and confirm",
          Colors.amber),
    ]);
  }
}
