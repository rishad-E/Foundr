// To parse this JSON data, do
//
//     final updateUseraboutModel = updateUseraboutModelFromJson(jsonString);

// import 'dart:convert';

// UpdateUseraboutModel updateUseraboutModelFromJson(String str) => UpdateUseraboutModel.fromJson(json.decode(str));

// String updateUseraboutModelToJson(UpdateUseraboutModel data) => json.encode(data.toJson());

class UpdateUseraboutModel {
    UpdateUseraboutModel({
        this.intro,
        this.gender,
        this.age,
        this.country,
        this.state,
        this.city,
    });

    final String? intro;
    final String? gender;
    final String? age;
    final String? country;
    final String? state;
    final String? city;

    factory UpdateUseraboutModel.fromJson(Map<String, dynamic> json) => UpdateUseraboutModel(
        intro: json["intro"],
        gender: json["gender"],
        age: json["age"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "intro": intro,
        "gender": gender,
        "age": age,
        "country": country,
        "state": state,
        "city": city,
    };
}
