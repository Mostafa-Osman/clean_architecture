import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/google_pay_constants.dart'
    as google_pay_constants;
import 'package:square_in_app_payments/models.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  bool googlePayEnabled = false;

  Future<void> initSquarePayment() async {
    var canUseGooglePay = false;
    if (Platform.isAndroid) {
      await InAppPayments.initializeGooglePay(
          'LOCATION_ID', google_pay_constants.environmentTest);
      canUseGooglePay = await InAppPayments.canUseGooglePay;
    }
    googlePayEnabled = canUseGooglePay;
    emit(PaymentRefreshUi());
  }

  void onStartGooglePay() async {
    try {
      await InAppPayments.requestGooglePayNonce(
          price: '1.00',
          currencyCode: 'USD',
          onGooglePayNonceRequestSuccess: _onGooglePayNonceRequestSuccess,
          onGooglePayNonceRequestFailure: _onGooglePayNonceRequestFailure,
          onGooglePayCanceled: _onGooglePayCancel,
          priceStatus: 9);
    } on InAppPaymentsException catch (ex) {
      // handle the failure of starting apple pay
    }
  }

  void _onGooglePayNonceRequestSuccess(CardDetails result) async {
    try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);

    } on Exception catch (ex) {
      // handle card nonce processing failure
    }
  }

  void _onGooglePayCancel() {
    // handle google pay canceled
  }

  void _onGooglePayNonceRequestFailure(ErrorInfo errorInfo) {
    // handle google pay failure
  }
}
