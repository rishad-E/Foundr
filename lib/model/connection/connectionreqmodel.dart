// To parse this JSON data, do
//
//     final connectionReqModel = connectionReqModelFromJson(jsonString);

// import 'dart:convert';

// ConnectionReqModel connectionReqModelFromJson(String str) => ConnectionReqModel.fromJson(json.decode(str));

// String connectionReqModelToJson(ConnectionReqModel data) => json.encode(data.toJson());

class ConnectionReqModel {
  ConnectionReqModel({
    this.receiver,
    // this.type,
    // this.message,
  });

  final String? receiver;
  // final String? type;
  // final String? message;

  factory ConnectionReqModel.fromJson(Map<String, dynamic> json) =>
      ConnectionReqModel(
        receiver: json["receiver"],
        // type: json["type"],
        // message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "receiver": receiver,
        "type": "request",
        "message": "sent you a connection request"
      };
}
