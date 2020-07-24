import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/config.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/common/shimmer_card.dart';
import 'package:mskirana_app/ui/tracking/track_order_view.dart';
import 'package:mskirana_app/ui/tracking/track_presenter.dart';

class TrackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrackPageState();
}

class TrackPageState extends State<TrackPage> implements TrackContract {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  TrackPresenter presenter;
  List<Order> orders = new List();
  bool firstFetch = false;

  TrackPageState() {
    presenter = new TrackPresenter(this);
    presenter.fetch();
  }

  void subscribeToOrder(String orderId) {
    Timer.periodic(new Duration(seconds: Config.refreshIntervalSeconds),
        (timer) {
      presenter.fetchOne(orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.tracking),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 36, 10, 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Current Order",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                (firstFetch)
                    ? TrackOrderView(orders.where((o) => o.isActive()).toList())
                    : ShimmerCard(),
                Divider(),
                Text("Past Order(s)",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                (firstFetch)
                    ? TrackOrderView(
                        orders.where((o) => !o.isActive()).toList())
                    : ShimmerCard(),
              ],
            ))));
  }

  @override
  void onFetchError(String errorText) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text('Network error while trying to fetch new orders')));
  }

  @override
  void onFetchSuccess(List<Order> orders) {
    // update the orders
    setState(() {
      if (!this.firstFetch) {
        this.firstFetch = true;
        // subscribe to the active orders
        orders.where((o) => o.isActive()).forEach((o) {
          subscribeToOrder(o.id);
        });
      }
      this.orders = orders;
    });
  }

  @override
  void onFetchOneSuccess(Order order) {
    setState(() {
      // remove the old instance
      this.orders.removeWhere((o) => o.id == order.id);
      // add the new instance
      this.orders.add(order);
    });
  }
}
