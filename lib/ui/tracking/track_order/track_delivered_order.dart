import 'package:flutter/material.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_header.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_info.dart';
import 'package:mskirana_app/utils/misc.dart';
import 'package:intl/intl.dart';

class TrackDeliveredOrder extends StatelessWidget {
  final Order order;

  TrackDeliveredOrder(this.order);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TrackOrderHeader("assets/delivery.png", "Your order has been delivered!",
          Colors.green),
      TrackOrderInfo("Order was placed on " +
          DateFormat('d/M hh:mm a').format(getTimeStampFromId(order.id)))
    ]);
  }
}
