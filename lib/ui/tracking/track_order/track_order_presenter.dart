import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/rest/order.dart';

abstract class TrackOrderContract {
  void onAcceptOrderSuccess();
  void onAcceptOrderError(String errorText);
  void onEditOrderSuccess();
  void onEditOrderError(String errorText);
  void onFetchOrderSuccess(Order order);
  void onFetchOrderError(String errorText);
}

class TrackOrderPresenter {
  final TrackOrderContract contract;
  TrackOrderPresenter(this.contract);

  fetchOrder(String orderId) {
    OrderRestClient.fetchOrder(orderId)
        .then((order) => contract.onFetchOrderSuccess(order))
        .catchError(
            (Object error) => contract.onFetchOrderError(error.toString()));
  }

  editOrder(Order order) {
    OrderRestClient.editOrder(order)
        .then((_) => contract.onEditOrderSuccess())
        .catchError(
            (Object error) => contract.onEditOrderError(error.toString()));
  }

  acceptOrder(Order order) {
    OrderRestClient.acceptOrder(order)
        .then((_) => contract.onAcceptOrderSuccess())
        .catchError(
            (Object error) => contract.onAcceptOrderError(error.toString()));
  }
}
