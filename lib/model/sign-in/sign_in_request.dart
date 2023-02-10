import 'dart:convert';

SigninreqModel signinrequestFromJson(String str) => SigninreqModel.fromJson(json.decode(str));

String signinrequestToJson(SigninreqModel data) => json.encode(data.toJson());

class SigninreqModel {
    SigninreqModel({
        this.password,
        this.email,
    });

    String? password;
    String? email;

    factory SigninreqModel.fromJson(Map<String, dynamic> json) => SigninreqModel(
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
    };
}
