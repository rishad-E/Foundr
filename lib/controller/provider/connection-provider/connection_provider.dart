import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/connection/connectionreqmodel.dart';
import 'package:founder_app/services/connection/connection_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';

class ConnectionProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  /* -------------provider to send connection-----------*/
  Future<void> sendConnection(String id, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    final sender = ConnectionReqModel(receiver: id);
    ConnectionRequestService().sendConnectionService(sender, token!).then(
          (value) => {
            if (value == true)
              {
                SnackbarPopUps.popUpG("connection Send Suceesfully", context),
              }
            else if (value == false)
              {
                SnackbarPopUps.popUpB("Request Connection Failed", context),
              }
          },
        );
  }
}
