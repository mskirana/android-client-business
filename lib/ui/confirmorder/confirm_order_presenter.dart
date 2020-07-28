import 'package:mskirana_app/models/order.dart';
import 'package:mskirana_app/models/product.dart';
import 'package:mskirana_app/rest/order.dart';

abstract class ConfirmOrderContract {
  void onCreateOrderSuccess(Order order);
  void onCreateOrderError(String errorText);
}

class ConfirmOrderPresenter {
  final ConfirmOrderContract contract;
  ConfirmOrderPresenter(this.contract);

  create(Order order) {
    OrderRestClient.createOrder(order)
        .then((Order order) => contract.onCreateOrderSuccess(order))
        .catchError(
            (Object error) => contract.onCreateOrderError(error.toString()));
  }
}
