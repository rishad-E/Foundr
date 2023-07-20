import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:founder_app/services/event/event_join_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  Razorpay razorpay = Razorpay();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  void openCheckout(amount, eventId, joinLink, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    // log(JwtDecoder.decode(token.toString()).toString(),name: 'username kittan');
    final options = {
      'key': 'rzp_test_ylRlOxUN6l346l',
      'amount': amount * 100,
      'name': 'Foundr',
      'description': 'Join the event',
      'prefill': {'contact': '7034527959', 'email': 'Foundr@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
        EventJoinService().joinEvent(token!, eventId, joinLink).then(
              (value) => {
                if (value == false)
                  {SnackbarPopUps.popUpB("Something Went wrong", context)}
                else if (value == true)
                  {
                    SnackbarPopUps.popUpG(
                        "Link Send to your registerd Email", context)
                  }
              },
            );
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
     
    } on PaymentFailureResponse catch (e) {
      log(e.toString(), name: 'razorpay catch');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    // Fluttertoast.showToast(
    //     msg: "Payment successful with id ${response.paymentId!}");
    log("Payment success with signature ${response.signature}",
        name: 'success');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment failed with error ${response.message}");
    log("Payment error with code ${response.error}", name: 'error');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(msg: "Payment made using ${response.walletName}");
    log("External wallet used: ${response.walletName}", name: 'wallet');
  }
}
