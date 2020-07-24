import 'package:flutter/material.dart';

import 'confirm_order_item_card.dart';

class ConfirmOrderItemViewState extends State<ConfirmOrderItemView> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          ConfirmOrderItemCard(productsList : widget.productsList),
    ]);
  }
}

class ConfirmOrderItemView extends StatefulWidget {
 final List<dynamic> productsList;
 ConfirmOrderItemView({@required this.productsList});
 @override
  ConfirmOrderItemViewState createState() => ConfirmOrderItemViewState();
}