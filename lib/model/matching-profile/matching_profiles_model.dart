// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

// import 'dart:convert';

// UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

// String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        this.matchingProfiles,
        this.page,
        this.totalPages,
    });

    final List<MatchingProfile>? matchingProfiles;
    final String? page;
    final int? totalPages;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        matchingProfiles: json["matchingProfiles"] == null ? [] : List<MatchingProfile>.from(json["matchingProfiles"]!.map((x) => MatchingProfile.fromJson(x))),
        page: json["page"],
        totalPages: json["totalPages"],
    );

    Map<String, dynamic> toJson() => {
        "matchingProfiles": matchingProfiles == null ? [] : List<dynamic>.from(matchingProfiles!.map((x) => x.toJson())),
        "page": page,
        "totalPages": totalPages,
    };
}

class MatchingProfile {
    MatchingProfile({
        this.id,
        this.userName,
        this.email,
        this.password,
        this.status,
        this.responsibilities,
        this.interests,
        this.cofounderResponsibilities,
        this.connections,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.profilePhoto,
        this.location,
        this.age,
        this.gender,
        this.intro,
    });

    final String? id;
    final String? userName;
    final String? email;
    final String? password;
    final Status? status;
    final List<dynamic>? responsibilities;
    final List<dynamic>? interests;
    final List<dynamic>? cofounderResponsibilities;
    final List<dynamic>? connections;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? profilePhoto;
    final Location? location;
    final int? age;
    final String? gender;
    final String? intro;

    factory MatchingProfile.fromJson(Map<String, dynamic> json) => MatchingProfile(
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        status: statusValues.map[json["status"]]!,
        responsibilities: json["responsibilities"] == null ? [] : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null ? [] : List<dynamic>.from(json["interests"]!.map((x) => x)),
        cofounderResponsibilities: json["cofounderResponsibilities"] == null ? [] : List<dynamic>.from(json["cofounderResponsibilities"]!.map((x) => x)),
        connections: json["connections"] == null ? [] : List<dynamic>.from(json["connections"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profilePhoto: json["profilePhoto"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        age: json["age"],
        gender: json["gender"],
        intro: json["intro"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "email": email,
        "password": password,
        "status": statusValues.reverse[status],
        "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
        "cofounderResponsibilities": cofounderResponsibilities == null ? [] : List<dynamic>.from(cofounderResponsibilities!.map((x) => x)),
        "connections": connections == null ? [] : List<dynamic>.from(connections!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePhoto": profilePhoto,
        "location": location?.toJson(),
        "age": age,
        "gender": gender,
        "intro": intro,
    };
}

class Location {
    Location({
        this.country,
        this.state,
        this.city,
    });

    final String? country;
    final String? state;
    final String? city;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
    };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
