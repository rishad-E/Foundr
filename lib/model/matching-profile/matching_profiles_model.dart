// // To parse this JSON data, do
// //
// //     final matchingProfileModel = matchingProfileModelFromJson(jsonString);

// import 'dart:convert';

// MatchingProfileModel matchingProfileModelFromJson(String str) => MatchingProfileModel.fromJson(json.decode(str));

// String matchingProfileModelToJson(MatchingProfileModel data) => json.encode(data.toJson());

class MatchingProfileModel {
    MatchingProfileModel({
        this.matchingProfiles,
        this.page,
        this.totalPages,
    });

    final List<MatchingProfile>? matchingProfiles;
    final String? page;
    final int? totalPages;

    factory MatchingProfileModel.fromJson(Map<String, dynamic> json) => MatchingProfileModel(
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
    });

    final String? id;
    final String? userName;
    final String? email;
    final String? password;
    final String? status;
    final List<dynamic>? responsibilities;
    final List<dynamic>? interests;
    final List<dynamic>? cofounderResponsibilities;
    final List<dynamic>? connections;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory MatchingProfile.fromJson(Map<String, dynamic> json) => MatchingProfile(
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        responsibilities: json["responsibilities"] == null ? [] : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null ? [] : List<dynamic>.from(json["interests"]!.map((x) => x)),
        cofounderResponsibilities: json["cofounderResponsibilities"] == null ? [] : List<dynamic>.from(json["cofounderResponsibilities"]!.map((x) => x)),
        connections: json["connections"] == null ? [] : List<dynamic>.from(json["connections"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "email": email,
        "password": password,
        "status": status,
        "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
        "cofounderResponsibilities": cofounderResponsibilities == null ? [] : List<dynamic>.from(cofounderResponsibilities!.map((x) => x)),
        "connections": connections == null ? [] : List<dynamic>.from(connections!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
