import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/order/order_item_card.dart';

final keyItem = new GlobalKey<OrderItemCardState>();

class OrderItemViewState extends State<OrderItemView> {

  final cards = [
    OrderItemCard(key: keyItem)
  ];

  List<dynamic> get productsList => keyItem.currentState.products;
  

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: ListView(
        children: cards,
      ))
    ]);
  }
}

class OrderItemView extends StatefulWidget {
 OrderItemView({ Key key }) : super(key: key);
 @override
  OrderItemViewState createState() => OrderItemViewState();
}