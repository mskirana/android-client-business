import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_header.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_info.dart';

class TrackAcceptedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TrackOrderHeader(
          "assets/accepted.png", "Your order has been confirmed", Colors.green),
      TrackOrderInfo("Estimated delivery time: 15 mins")
    ]);
  }
}
