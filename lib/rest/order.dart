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

  /// fetch an order by Id
  static Future<Order> fetchOrder(String orderId) async {
    final response = await http.get(Config.apiUrl + "/order/" + orderId);

    if (response.statusCode == 200) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch order " + orderId);
    }
  }

  static Future<Order> createOrder(Order order) async {
    final body = json.encode(order.toJson());
    final response = await http.post(Config.apiUrl + "/order/",
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return Order.fromJson(result["order"]);
    } else {
      throw Exception("Failed to create order ");
    }
  }

  static Future<bool> editOrder(Order order) async {
    final body = json.encode(order.toJson());
    final response =
        await http.post(Config.apiUrl + "/order/" + order.id + '/edit',
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to create order ");
    }
  }

  static Future<bool> acceptOrder(Order order) async {
    final response =
        await http.put(Config.apiUrl + "/order/" + order.id + '/accept');

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      throw Exception("Failed to accept order ");
    }
  }
}
