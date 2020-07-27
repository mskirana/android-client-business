import 'package:flutter/material.dart';

class Product {
  String title, quantity;
  int price;
  bool available;

  Product(
      {@required this.title,
      this.quantity,
      this.price = 0,
      this.available = true});

  String toString() {
    return title;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    var p = Product(title: json["title"], quantity: json["quantity"]);
    if (json.containsKey("price")) p.price = json["price"];
    if (json.containsKey("available")) p.available = json["available"];
    return p;
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'quantity': quantity};
  }
}
