import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/product.dart';

enum ProductCardType { display, edit, review }

class ProductCard extends StatefulWidget {
  final Product product;
  final ProductCardType type;

  ProductCard(this.product, {@required this.type});

  @override
  State<StatefulWidget> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: (widget.type == ProductCardType.edit)
                ? Container()
                : Text(
                    widget.product.title,
                    style: GoogleFonts.openSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            trailing: (widget.type == ProductCardType.edit)
                ? Container()
                : Text(widget.product.quantity,
                    style: GoogleFonts.openSans(fontSize: 14))));
  }
}
