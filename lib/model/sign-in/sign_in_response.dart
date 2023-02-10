
import 'dart:convert';

SigninRespModel signinresponseFromJson(String str) => SigninRespModel.fromJson(json.decode(str));

String signinresponseToJson(SigninRespModel data) => json.encode(data.toJson());

class SigninRespModel {
    SigninRespModel({
        this.message,
        this.userName,
        this.token,
    });

    String? message;
    String? userName;
    String? token;

    factory SigninRespModel.fromJson(Map<String, dynamic> json) => SigninRespModel(
        message: json["message"],
        userName: json["userName"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "userName": userName,
        "token": token,
    };
}
