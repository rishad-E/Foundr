// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

// import 'dart:convert';

// UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

// String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

// class UserProfileModel {
//     UserProfileModel({
//         this.events,
//     });

//     final List<Event>? events;

//     factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
//         events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
//     };
// }

class Event {
    Event({
        this.id,
        this.mentorName,
        this.title,
        this.description,
        this.dateAndTime,
        this.venue,
        this.mentorImage,
        this.attendees,
        this.feedback,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.joinLink,
        this.enrollmentFee,
    });

    final String? id;
    final String? mentorName;
    final String? title;
    final String? description;
    final DateTime? dateAndTime;
    final String? venue;
    final String? mentorImage;
    final List<dynamic>? attendees;
    final List<String>? feedback;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? joinLink;
    final int? enrollmentFee;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
        mentorName: json["mentorName"],
        title: json["title"],
        description: json["description"],
        dateAndTime: json["dateAndTime"] == null ? null : DateTime.parse(json["dateAndTime"]),
        venue: json["venue"],
        mentorImage: json["mentorImage"],
        attendees: json["attendees"] == null ? [] : List<dynamic>.from(json["attendees"]!.map((x) => x)),
        feedback: json["feedback"] == null ? [] : List<String>.from(json["feedback"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        joinLink: json["joinLink"],
        enrollmentFee: json["enrollmentFee"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "mentorName": mentorName,
        "title": title,
        "description": description,
        "dateAndTime": dateAndTime?.toIso8601String(),
        "venue": venue,
        "mentorImage": mentorImage,
        "attendees": attendees == null ? [] : List<dynamic>.from(attendees!.map((x) => x)),
        "feedback": feedback == null ? [] : List<dynamic>.from(feedback!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "joinLink": joinLink,
        "enrollmentFee": enrollmentFee,
    };
}
