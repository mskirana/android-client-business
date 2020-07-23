import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mskirana_app/config.dart';
import 'package:mskirana_app/models/order.dart';

class OrderRestClient {
  /// fetch all orders from the server
  static Future<List<Order>> fetchOrders() async {
    final response = await http.get(Config.apiUrl + "/order");

    if (response.statusCode == 200) {
      List orderList = json.decode(response.body);
      return orderList.map((o) => Order.fromJson(o)).toList();
    } else {
      throw Exception("Failed to fetch orders");
    }
  }
}
