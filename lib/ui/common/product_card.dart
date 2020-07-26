import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mskirana_app/models/product.dart';

enum ProductCardType { display, edit, review }

class ProductCard extends StatefulWidget {
  final Product product;
  final ProductCardType type;
  final int index;
  final Function(int idx) notifyParentDelete;
  final Function(int idx, String title, String quantity) notifyParentSave;

  ProductCard(this.product,
      {Key key,
      @required this.index,
      this.notifyParentDelete,
      this.notifyParentSave,
      this.type})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  ProductCardType type;
  TextEditingController productTitleController = new TextEditingController();
  TextEditingController productQuantityController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    type = widget.type;
    productTitleController.text = widget.product.title;
    productQuantityController.text = widget.product.quantity;
  }

  List<Widget> getListTileTitle() {
    List<Widget> widgets = [];
    if (this.type == ProductCardType.edit) {
      // if editing, show a TextField
      widgets.add(Container(
          width: 120,
          child: TextField(
            controller: productTitleController,
            decoration: InputDecoration(hintText: "Item name"),
          )));
    } else {
      // otherwise show a static text box
      widgets.add(Container(
          width: 140,
          child: Text(
            productTitleController.text,
            style:
                GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
          )));
      // show price if it is present
      if (widget.product.price != 0 && widget.product.available)
        widgets.add(Text("₹" + widget.product.price.toString()));
    }
    return widgets;
  }

  Widget getQuantityWidget() {
    if (!widget.product.available)
      return Text("unavailable",
          style: GoogleFonts.openSans(
              color: Colors.red, fontWeight: FontWeight.bold));
    if (this.type == ProductCardType.edit)
      return Container(
          width: 40,
          child: TextField(
              controller: productQuantityController,
              decoration: InputDecoration(hintText: "Qty")));
    else
      return Text(productQuantityController.text,
          style: GoogleFonts.openSans(fontSize: 14));
  }

  List<Widget> getListTileTrailing() {
    List<Widget> widgets = [getQuantityWidget()];
    if (this.type == ProductCardType.review && widget.product.available) {
      widgets.addAll([
        IconButton(
            icon: Icon(Icons.close),
            color: Colors.red,
            iconSize: 20,
            onPressed: () {
              widget.notifyParentDelete(widget.index);
            })
      ]);
    } else if (this.type == ProductCardType.edit) {
      widgets.add(IconButton(
          icon: Icon(Icons.check),
          color: Colors.green,
          iconSize: 30,
          onPressed: () {
            if (productTitleController.text != "" &&
                productQuantityController.text != "")
              setState(() {
                type = ProductCardType.review;
              });
            widget.notifyParentSave(widget.index, productTitleController.text,
                productQuantityController.text);
          }));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // if (productTitleController.text == "") type = ProductCardType.edit;

    return Card(
        color: (widget.product.available) ? Colors.white : Colors.red[200],
        child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: getListTileTitle()),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: getListTileTrailing())));
  }
}
