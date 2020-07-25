import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/ui/common/product_card.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_placed_order.dart';

class TrackOrderPage extends StatefulWidget {
  final Order order;

  TrackOrderPage(this.order);

  @override
  State<StatefulWidget> createState() => TrackOrderState();
}

class TrackOrderState extends State<TrackOrderPage> {
  Widget getWidget() {
    if (widget.order.status == "placed")
      return TrackPlacedOrder(widget.order);
    else
      return Container();
  }

  ProductCardType getType() {
    if (widget.order.status == "placed")
      return ProductCardType.display;
    else
      return ProductCardType.review;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.tracking),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 36, 10, 20),
          child: Column(children: <Widget>[
            Text("Track this order",
                style: GoogleFonts.openSans(
                    fontSize: 32, fontWeight: FontWeight.bold)),
            getWidget(),
            Expanded(
                child: ListView.builder(
              itemCount: widget.order.products.length,
              itemBuilder: (context, index) =>
                  ProductCard(widget.order.products[index], type: getType()),
            ))
          ])),
    );
  }
}
