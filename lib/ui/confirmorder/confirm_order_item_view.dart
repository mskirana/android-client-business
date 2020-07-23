import 'package:flutter/material.dart';

import 'confirm_order_item_card.dart';

final keyItem = new GlobalKey<ConfirmOrderItemCardState>();

class ConfirmOrderItemViewState extends State<ConfirmOrderItemView> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          ConfirmOrderItemCard(key: keyItem, productsList : widget.productsList),
    ]);
  }
}

class ConfirmOrderItemView extends StatefulWidget {
 final List<dynamic> productsList;
 ConfirmOrderItemView({ Key key, @required this.productsList }) : super(key: key);
 @override
  ConfirmOrderItemViewState createState() => ConfirmOrderItemViewState();
}