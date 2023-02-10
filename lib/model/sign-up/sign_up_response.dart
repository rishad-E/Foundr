
import 'dart:convert';

SignupRespModel signupRespModelFromJson(String str) => SignupRespModel.fromJson(json.decode(str));

String signupRespModelToJson(SignupRespModel data) => json.encode(data.toJson());

class SignupRespModel {
    SignupRespModel({
        this.message,
        this.userName,
        this.token,
    });

    String? message;
    String? userName;
    String? token;

    factory SignupRespModel.fromJson(Map<String, dynamic> json) => SignupRespModel(
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
