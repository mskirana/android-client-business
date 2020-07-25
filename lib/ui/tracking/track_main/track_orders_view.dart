import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/tracking/track_main/track_orders_item.dart';

class TrackOrdersView extends StatelessWidget {
  final List<Order> orders;

  TrackOrdersView(this.orders);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (100 * (min(2.5, max(1, orders.length)))).toDouble(),
        child: (orders.length > 0)
            ? ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) => TrackOrdersItem(orders[index]))
            : Text("Nothing here!"));
  }
}
