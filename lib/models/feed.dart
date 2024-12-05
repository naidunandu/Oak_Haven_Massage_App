// To parse this JSON data, do
//
//     final feed = feedFromJson(jsonString);

import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  String description;
  List<dynamic> images;
  int like;
  int comment;
  String time;
  User user;

  Feed({
    required this.description,
    required this.images,
    required this.like,
    required this.comment,
    required this.time,
    required this.user,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        like: json["like"],
        comment: json["comment"],
        time: json["time"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "like": like,
        "comment": comment,
        "time": time,
        "user": user.toJson(),
      };
}

class User {
  String name;
  String occupation;
  String profileImage;

  User({
    required this.name,
    required this.occupation,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        occupation: json["occupation"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "occupation": occupation,
        "profileImage": profileImage,
      };
}
