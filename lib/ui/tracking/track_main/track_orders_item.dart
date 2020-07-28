import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/utils/misc.dart';
import 'package:intl/intl.dart';

class TrackOrdersItem extends StatelessWidget {
  final Order order;

  TrackOrdersItem(this.order);

  String getProductsHint() {
    String products = order.products.join(", ");
    if (products.length > 15) {
      products = products.substring(0, 12) + "...";
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: Card(
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/trackOrder', arguments: order);
            },
            title: Text(getProductsHint(),
                style: GoogleFonts.openSans(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      DateFormat('d/M hh:mm a')
                          .format(getTimeStampFromId(order.id)),
                      style: GoogleFonts.openSans(fontSize: 12)),
                  SizedBox(height: 10),
                  Text("Vijay Stores",
                      style: GoogleFonts.openSans(fontSize: 12))
                ]),
            subtitle: Text(order.status,
                style: GoogleFonts.openSans(
                    fontSize: 12, fontStyle: FontStyle.italic)),
          ),
        ));
  }
}
