// To parse this JSON data, do
//
//     final reqCoFounderUpdateModel = reqCoFounderUpdateModelFromJson(jsonString);

// import 'dart:convert';

// ReqCoFounderUpdateModel reqCoFounderUpdateModelFromJson(String str) => ReqCoFounderUpdateModel.fromJson(json.decode(str));

// String reqCoFounderUpdateModelToJson(ReqCoFounderUpdateModel data) => json.encode(data.toJson());

class ReqCoFounderUpdateModel {
    ReqCoFounderUpdateModel({
        this.activelySeeking,
        this.cofounderTechnical,
        this.cofounderHasIdea,
        this.locationPreference,
        this.cofounderResponsibilities,
    });

    final String? activelySeeking;
    final String? cofounderTechnical;
    final String? cofounderHasIdea;
    final String? locationPreference;
    final List<dynamic>? cofounderResponsibilities;

    factory ReqCoFounderUpdateModel.fromJson(Map<String, dynamic> json) => ReqCoFounderUpdateModel(
        activelySeeking: json["activelySeeking"],
        cofounderTechnical: json["cofounderTechnical"],
        cofounderHasIdea: json["cofounderHasIdea"],
        locationPreference: json["locationPreference"],
        cofounderResponsibilities: json["cofounderResponsibilities"] == null ? [] : List<dynamic>.from(json["cofounderResponsibilities"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "activelySeeking": activelySeeking,
        "cofounderTechnical": cofounderTechnical,
        "cofounderHasIdea": cofounderHasIdea,
        "locationPreference": locationPreference,
        "cofounderResponsibilities": cofounderResponsibilities == null ? [] : List<dynamic>.from(cofounderResponsibilities!.map((x) => x)),
    };
}
