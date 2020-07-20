import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_store_card.dart';
import 'package:mskirana_app/ui/home/home_store_category.dart';

class HomeStoreView extends StatelessWidget {
  final cards = [
    HomeStoreCard("Vijay Stores", "0.7KM", "Grocery and general store"),
    HomeStoreCard("Bharat Stores", "1.1KM", "Chemist and general store"),
    HomeStoreCard("Komal Collection", "1.2KM", "General store")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          HomeStoreCategory("Grocery", true),
          HomeStoreCategory("Snacks", false),
          HomeStoreCategory("Chemist", true),
          HomeStoreCategory("Bakery", false)
        ],
      ),
      Expanded(
          child: ListView(
        children: cards,
      ))
    ]);
  }
}
