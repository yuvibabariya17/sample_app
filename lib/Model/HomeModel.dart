// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

List<HomeScreenModel> homeScreenModelFromJson(String str) =>
    List<HomeScreenModel>.from(
        json.decode(str).map((x) => HomeScreenModel.fromJson(x)));

String homeScreenModelToJson(List<HomeScreenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeScreenModel {
  int userId;
  int id;
  String title;
  String body;

  HomeScreenModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
