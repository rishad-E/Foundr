import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/model/connection/connection_response-model.dart';
import 'package:founder_app/model/connection/connectionreqmodel.dart';
import 'package:founder_app/model/connection/getall_connection-model.dart';
import 'package:founder_app/model/connection/getconnectionresmodel.dart';
import 'package:founder_app/services/connection/connection_service.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';

class ConnectionProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<ConnectionRequest>? allConnectionReq;
  String? connectionCheck;
  List<Connection>? alltheConnection;
  int? listLength;
  /* -------------provider to get all connection request -----------*/

  Future<void> getallConnectionReq() async {
    String? token = await storage.read(key: 'token');
    ConnectionRequestService().getConnetionReqService(token!).then((value) => {
          allConnectionReq = value,
          notifyListeners(),
        });
  }

  /* ----------fuction to set the button-----------*/

  Future buttonFuction(String profileId) async {
    for (ConnectionRequest value in allConnectionReq!) {
      if (allConnectionReq == null) {
        connectionCheck = null;
        connectionCheck = 'No';
        notifyListeners();
      } else {
        if (profileId == value.receiver && value.status == 'pending') {
          //true means requested
          connectionCheck = null;
          connectionCheck = 'true';
          notifyListeners();
          break;
        } else if (profileId == value.sender && value.status == 'pending') {
          //false means accept or reject
          connectionCheck = null;
          connectionCheck = 'false';
          notifyListeners();
          break;
        } else if (profileId == value.sender ||
            profileId == value.receiver && value.status == 'accepted') {
          connectionCheck = null;
          connectionCheck = 'message';
          notifyListeners();
          break;
        } else if (profileId != value.sender || profileId != value.receiver) {
          //no means no requestes just as null
          connectionCheck = null;
          connectionCheck = 'No';
          notifyListeners();
          // break;
        }
      }
    }
    log(connectionCheck.toString(), name: 'conn');
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

  /* -------------provider to update request-----------*/
  Future<void> updateConnectionProvider(
      String res, String profileId, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    bool? response;
    String? message;
    if (res == 'true') {
      message = 'Request accepted, Send a message now!';
      response = true;
    } else if (res == 'false') {
      message = 'Request rejected, They missed the opportunity!';
      response = false;
    }
    log(message.toString(), name: 'message');
    log(response.toString(), name: 'response');

    final update = ConnectionUpdateModel(
        reqFrom: profileId,
        type: 'response',
        response: response,
        message: message);
    ConnectionRequestService()
        .updateConnectionService(update, token!)
        .then((value) => {
              if (value == true)
                {SnackbarPopUps.popUpG("Connection made successfully", context)}
              else
                {SnackbarPopUps.popUpB("connection rejected", context)}
            });

    notifyListeners();
  }

  /* -------------provider to get all connections-----------*/
  Future<void> getalltheConnections() async {
    String? token = await storage.read(key: 'token');
    ConnectionRequestService().getallConnectionService(token!).then((value) => {
          alltheConnection = value,
          listLength= alltheConnection!.length,
          notifyListeners(),
        });
  }
}
