import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/rest/order.dart';

abstract class TrackOrderContract {
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
}
