import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/config.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/models/product.dart';
import 'package:mskirana_app/ui/common/product_card.dart';
import 'package:mskirana_app/ui/common/shared_bottom_bar.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_accepted_order.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_delivered_order.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_order_presenter.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_placed_order.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_rejected_order.dart';
import 'package:mskirana_app/ui/tracking/track_order/track_review_order.dart';

class TrackOrderPage extends StatefulWidget {
  final Order order;

  TrackOrderPage(this.order);

  @override
  State<StatefulWidget> createState() => TrackOrderState();
}

class TrackOrderState extends State<TrackOrderPage>
    implements TrackOrderContract {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final GlobalKey listViewKey = new GlobalKey();

  // adjusting scroll for listview
  final ScrollController productListScrollController = new ScrollController();
  TrackOrderPresenter presenter;

  // if true, order should be sent for review, otherwise can be accepted/rejected
  bool dirty = false;

  Order order;

  // runs a background service that updates the orders from subscription set
  Timer asyncServiceTimer;

  TrackOrderState() {
    presenter = new TrackOrderPresenter(this);
    // start a timer to fetch the order periodically
    asyncServiceTimer = Timer.periodic(
        new Duration(seconds: Config.refreshIntervalSeconds), (timer) {
      presenter.fetchOrder(this.order.id);
    });
  }

  @override
  void initState() {
    super.initState();
    order = widget.order;
  }

  @override
  void dispose() {
    asyncServiceTimer.cancel();
    super.dispose();
  }

  // Get Widget for an order based on its status
  Widget getStatusWidget() {
    return {
      "placed": TrackPlacedOrder(),
      "accepted": TrackAcceptedOrder(),
      "delivered": TrackDeliveredOrder(this.order),
      "review": TrackReviewOrder(),
      "rejected": TrackRejectedOrder(this.order)
    }[this.order.status];
  }

  // Get ProductCardType for an order's product based on order status
  ProductCardType getType(Product product) {
    // is it a new product?
    if (product.title == "") return ProductCardType.edit;
    // is it in review mode?
    if (this.order.status == "review")
      return ProductCardType.review;
    else
      return ProductCardType.display;
  }

  Widget getBoldPrefixText(String prefix, String text) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(prefix,
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
          Text(text, style: GoogleFonts.openSans())
        ]);
  }

  Widget getTotalPrice() {
    if (["accepted", "delivered", "review"].contains(order.status)) {
      return getBoldPrefixText("Total price: ",
          "₹" + order.products.fold(0, (sum, p) => sum + p.price).toString());
    }
    return Container();
  }

  Widget getRemarks() {
    if (this.order.status == "placed" && this.order.remarks != "") {
      return getBoldPrefixText("Remarks: ", this.order.remarks);
    } else if (this.order.status == "review" && this.order.remarks != "") {
      return getBoldPrefixText("Store comments: ", this.order.remarks);
    } else
      return Container();
  }

  Widget getConfirmButtons() {
    if (order.status != "review") return Container();
    if (dirty) {
      // send the order back for review
      return ButtonTheme(
          minWidth: 200,
          height: 50,
          child: RaisedButton(
              onPressed: () {},
              color: Colors.purple[200],
              child: Text('Confirm', style: GoogleFonts.openSans(fontSize: 16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60))));
    } else {
      // confirm and pay or reject order
      return Column(children: [
        ButtonTheme(
            minWidth: 200,
            height: 50,
            child: RaisedButton(
                onPressed: () {},
                color: Colors.purple[200],
                child: Text('Confirm and Pay',
                    style: GoogleFonts.openSans(fontSize: 16)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)))),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.cancel, color: Colors.blue),
            Text(" Cancel order",
                style: GoogleFonts.openSans(color: Colors.blue))
          ],
        )
      ]);
    }
  }

  void deleteProduct(int index) {
    setState(() {
      this.order.products.removeAt(index);
    });
  }

  void saveProduct(int index, String title, String quantity) {
    setState(() {
      this.order.products[index] =
          new Product(title: title, quantity: quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      floatingActionButton: (this.order.status == "review")
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.purple[200],
              onPressed: () {
                productListScrollController.jumpTo(
                    productListScrollController.position.minScrollExtent);
                setState(() {
                  order.products
                      .insert(0, new Product(title: "", quantity: ""));
                });
              },
            )
          : Container(),
      bottomNavigationBar: SharedBottomBar(SharedBottomBarEnum.tracking),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 36, 10, 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Track this order",
                    style: GoogleFonts.openSans(
                        fontSize: 32, fontWeight: FontWeight.bold)),
                (MediaQuery.of(context).viewInsets.bottom == 0)
                    ? getStatusWidget()
                    : Container(),
                Expanded(
                    child: ListView(
                        key: listViewKey,
                        controller: productListScrollController,
                        children: () {
                          List<Widget> productCards = [];
                          this.order.products.asMap().forEach((idx, p) {
                            productCards.add(ProductCard(
                              p,
                              key: ObjectKey(p.title),
                              index: idx,
                              notifyParentDelete: deleteProduct,
                              notifyParentSave: saveProduct,
                              type: getType(p),
                            ));
                          });
                          return productCards;
                        }())),
                getTotalPrice(),
                getRemarks(),
                Divider(),
                getConfirmButtons(),
              ])),
    );
  }

  @override
  void onFetchOrderError(String errorText) {
    scaffoldkey.currentState.showSnackBar(
        SnackBar(content: Text('Network error while trying to refresh order')));
  }

  @override
  void onFetchOrderSuccess(Order order) {
    if (order.status == 'review') return;
    // update the order
    setState(() {
      this.order = order;
    });
  }
}
