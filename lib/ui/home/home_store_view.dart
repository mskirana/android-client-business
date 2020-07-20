import 'package:flutter/material.dart';
import 'package:mskirana_app/ui/home/home_store_card.dart';

class HomeStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HomeStoreCard("Vijay Stores", "0.7KM", "Grocery and general store"),
        HomeStoreCard("Bharat Stores", "1.1KM", "Chemist and general store"),
        HomeStoreCard("Komal Collection", "1.2KM", "General store")
      ],
    );
  }
}
