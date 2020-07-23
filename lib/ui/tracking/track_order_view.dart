import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/tracking/track_order_item.dart';

class TrackOrderView extends StatelessWidget {
  final List<Order> orders;

  TrackOrderView(this.orders);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: min(100, 100 * orders.length.toDouble()),
        child: (orders.length > 0)
            ? ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) => TrackOrderItem(orders[index]))
            : Text("Nothing here!"));
  }
}
