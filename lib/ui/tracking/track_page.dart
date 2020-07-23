import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/tracking/track_order_view.dart';
import 'package:mskirana_app/ui/tracking/track_presenter.dart';

class TrackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrackPageState();
}

class TrackPageState extends State<TrackPage> implements TrackContract {
  TrackPresenter presenter;
  List<Order> orders;

  TrackPageState() {
    presenter = new TrackPresenter(this);
    orders = new List();
  }

  @override
  void initState() {
    super.initState();
    // presenter.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.tracking),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 36, 10, 20),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text("Current Order",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                TrackOrderView(orders
                    .where((o) => !["delivered", "rejected"].contains(o.status))
                    .toList()),
                Text("Past Order",
                    style: GoogleFonts.openSans(
                        fontSize: 36, fontWeight: FontWeight.bold)),
                TrackOrderView(orders
                    .where((o) => ["delivered", "rejected"].contains(o.status))
                    .toList()),
              ],
            ))));
  }

  @override
  void onFetchError(String errorText) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Network error while trying to fetch new orders')));
  }

  @override
  void onFetchSuccess(List<Order> orders) {
    // update the orders
    setState(() {
      this.orders = orders;
    });
  }
}
