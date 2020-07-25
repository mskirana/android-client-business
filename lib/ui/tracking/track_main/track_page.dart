import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/config.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/common/shimmer_card.dart';
import 'package:mskirana_app/ui/tracking/track_main/track_orders_view.dart';
import 'package:mskirana_app/ui/tracking/track_main/track_presenter.dart';

class TrackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrackPageState();
}

class TrackPageState extends State<TrackPage> implements TrackContract {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  TrackPresenter presenter;

  // runs a background service that updates the orders from subscription set
  Timer asyncServiceTimer;

  // set of orders that we are subscribed to
  Set<String> subscription = new Set();

  // list of all orders
  List<Order> orders = new List();

  // have we fetched for the first time?
  bool firstFetch = false;

  TrackPageState() {
    presenter = new TrackPresenter(this);
    presenter.fetch();
    // start a timer to update orders periodically
    asyncServiceTimer = Timer.periodic(
        new Duration(seconds: Config.refreshIntervalSeconds), (timer) {
      subscription.forEach((id) {
        presenter.fetchOne(id);
      });
    });
  }

  @override
  void dispose() {
    asyncServiceTimer.cancel();
    super.dispose();
  }

  void subscribeToOrder(String orderId) {
    subscription.add(orderId);
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
                    ? TrackOrdersView(
                        orders.where((o) => o.isActive()).toList())
                    : ShimmerCard(),
                Divider(),
                Text("Past Order(s)",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                (firstFetch)
                    ? TrackOrdersView(
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
      // find location of old instance
      int idx = this.orders.indexWhere((o) => o.id == order.id);
      // update with new instance
      this.orders.replaceRange(idx, idx + 1, [order]);
    });
  }
}
