import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/connection/connectionreqmodel.dart';
import 'package:founder_app/model/connection/getconnectionresmodel.dart';
import 'package:founder_app/services/connection/connection_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ConnectionProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<ConnectionRequest>? allConnection;
  bool? variable;

  /* -------------provider to get all connections-----------*/

  Future<void> getalltConnections() async {
    String? token = await storage.read(key: 'token');
    ConnectionRequestService().getConnetionService(token!).then((value) => {
          allConnection = value,
        });
  }

  Future<void> buttonFuction(String id) async {
    String? token = await storage.read(key: 'token');
    Map<String, dynamic> decodetoken = JwtDecoder.decode(token.toString());
    var profileId = decodetoken['userName'];
    log(profileId, name: 'jkdsafdsfhjf');
    if (allConnection == null) {
      return ;
    }else{
       for (ConnectionRequest value in allConnection!) {
      if (value.status == 'pending') {
        variable = true;
        // notifyListeners();
      } else {
        variable = false;
      }
    }
    }
  }

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
