import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class AddPaymentInfoViewModel extends ChangeNotifier {
  String totalyNotAKeyHiddenInPlainSightPleaseDontSteal =
      "sandbox-sq0idb-9Oah3D8P1EgPeemqjdJ4dQ"; // Super secret key don't tell anyone
  bool inited = false;
  String nonce;
  Future<void> initSquarePayment() async {
    //Dummy since no backend
    if (!inited) {
      await InAppPayments.setSquareApplicationId(
          totalyNotAKeyHiddenInPlainSightPleaseDontSteal);
    }
  }

  Future<void> startCardEntryFlow() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // no retreat only forwards
  }

  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    try {
      nonce = result.nonce;
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on Exception catch (ex) {
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }

  void _onCardEntryComplete() {
    // Update UI to notify user that the payment flow is finished successfully
    notifyListeners();
  }
}
