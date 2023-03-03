// // To parse this JSON data, do
// //
// //     final userProfileModel = userProfileModelFromJson(jsonString);

// import 'dart:convert';

// UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

// String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        this.userDetails,
    });

    final UserDetails? userDetails;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        userDetails: json["userDetails"] == null ? null : UserDetails.fromJson(json["userDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "userDetails": userDetails?.toJson(),
    };
}

class UserDetails {
    UserDetails({
        this.responsibilities,
        this.interests,
        this.cofounderResponsibilities,
        this.connections,
        this.id,
        this.userName,
        this.email,
        this.status,
        this.isUserVerified,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final List<dynamic>? responsibilities;
    final List<dynamic>? interests;
    final List<dynamic>? cofounderResponsibilities;
    final List<dynamic>? connections;
    final String? id;
    final String? userName;
    final String? email;
    final String? status;
    final bool? isUserVerified;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        responsibilities: json["responsibilities"] == null ? [] : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null ? [] : List<dynamic>.from(json["interests"]!.map((x) => x)),
        cofounderResponsibilities: json["cofounderResponsibilities"] == null ? [] : List<dynamic>.from(json["cofounderResponsibilities"]!.map((x) => x)),
        connections: json["connections"] == null ? [] : List<dynamic>.from(json["connections"]!.map((x) => x)),
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        status: json["status"],
        isUserVerified: json["isUserVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
        "cofounderResponsibilities": cofounderResponsibilities == null ? [] : List<dynamic>.from(cofounderResponsibilities!.map((x) => x)),
        "connections": connections == null ? [] : List<dynamic>.from(connections!.map((x) => x)),
        "_id": id,
        "userName": userName,
        "email": email,
        "status": status,
        "isUserVerified": isUserVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
