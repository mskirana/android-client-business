import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_header.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_info.dart';

class TrackPlacedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TrackOrderHeader("assets/stopwatch.png",
          "Waiting for the store to confirm the items", Colors.amber),
      TrackOrderInfo("Estimated wait time: 2 mins")
    ]);
  }
}
