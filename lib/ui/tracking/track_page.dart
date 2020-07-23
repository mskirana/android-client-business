import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    ? TrackOrderView(orders
                        .where((o) =>
                            !["delivered", "rejected"].contains(o.status))
                        .toList())
                    : ShimmerCard(),
                Divider(),
                Text("Past Order(s)",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                (firstFetch)
                    ? TrackOrderView(orders
                        .where(
                            (o) => ["delivered", "rejected"].contains(o.status))
                        .toList())
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
      this.firstFetch = true;
      this.orders = orders;
    });
  }
}
