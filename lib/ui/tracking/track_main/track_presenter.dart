import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/rest/order.dart';

abstract class TrackContract {
  void onFetchSuccess(List<Order> orders);
  void onFetchOneSuccess(Order order);
  void onFetchError(String errorText);
}

class TrackPresenter {
  final TrackContract contract;
  TrackPresenter(this.contract);

  fetch() {
    OrderRestClient.fetchOrders()
        .then((List<Order> orders) => contract.onFetchSuccess(orders))
        .catchError((Object error) => contract.onFetchError(error.toString()));
  }

  fetchOne(String orderId) {
    OrderRestClient.fetchOrder(orderId)
        .then((Order order) => contract.onFetchOneSuccess(order))
        .catchError((Object error) => contract.onFetchError(error.toString()));
  }
}
