// To parse this JSON data, do
//
//     final reqFounderUpdateModel = reqFounderUpdateModelFromJson(jsonString);

import 'dart:convert';

ReqFounderUpdateModel reqFounderUpdateModelFromJson(String str) => ReqFounderUpdateModel.fromJson(json.decode(str));

String reqFounderUpdateModelToJson(ReqFounderUpdateModel data) => json.encode(data.toJson());

class ReqFounderUpdateModel {
    ReqFounderUpdateModel({
        this.isTechnical,
        this.haveIdea,
        this.accomplishments,
        this.education,
        this.employment,
        this.responsibilities,
        this.interests,
    });

    final int? isTechnical;
    final String? haveIdea;
    final String? accomplishments;
    final String? education;
    final String? employment;
    final List<dynamic>? responsibilities;
    final List<dynamic>? interests;

    factory ReqFounderUpdateModel.fromJson(Map<String, dynamic> json) => ReqFounderUpdateModel(
        isTechnical: json["isTechnical"],
        haveIdea: json["haveIdea"],
        accomplishments: json["accomplishments"],
        education: json["education"],
        employment: json["employment"],
        responsibilities: json["responsibilities"] == null ? [] : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null ? [] : List<dynamic>.from(json["interests"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "isTechnical": isTechnical,
        "haveIdea": haveIdea,
        "accomplishments": accomplishments,
        "education": education,
        "employment": employment,
        "responsibilities": responsibilities == null ? [] : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
    };
}
