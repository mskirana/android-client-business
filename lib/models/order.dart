import 'package:flutter/material.dart';
import 'package:mskirana_app/models/product.dart';

class Order {
  String id, status, remarks;
  List<Product> products;

  Order({this.id, this.status, this.remarks, this.products});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json["_id"],
        status: json["status"],
        remarks: json["remarks"],
        products: new List<Product>.from(
            json["products"].map((p) => Product.fromJson(p))));
  }

  Map<String, dynamic> toJson() {
    return {
      'remarks': remarks,
      'products': products.map((p) => p.toJson()).toList()
    };
  }

  bool isActive() {
    return !["delivered", "rejected"].contains(this.status);
  }
}
