// To parse this JSON data, do
//
//     final updateUserabout = updateUseraboutFromJson(jsonString);

// import 'dart:convert';

// UpdateUserabout updateUseraboutFromJson(String str) => UpdateUserabout.fromJson(json.decode(str));

// String updateUseraboutToJson(UpdateUserabout data) => json.encode(data.toJson());

class UpdateUserabout {
    UpdateUserabout({
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

    factory UpdateUserabout.fromJson(Map<String, dynamic> json) => UpdateUserabout(
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
