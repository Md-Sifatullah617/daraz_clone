// To parse this JSON data, do
//
//     final getDivisionModel = getDivisionModelFromJson(jsonString);

import 'dart:convert';

GetDivisionModel getDivisionModelFromJson(String str) =>
    GetDivisionModel.fromJson(json.decode(str));

String getDivisionModelToJson(GetDivisionModel data) =>
    json.encode(data.toJson());

class GetDivisionModel {
  final String? message;
  final List<Division>? data;

  GetDivisionModel({
    this.message,
    this.data,
  });

  factory GetDivisionModel.fromJson(Map<String, dynamic> json) =>
      GetDivisionModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Division>.from(
                json["data"]!.map((x) => Division.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Division {
  final int? id;
  final String? name;

  Division({
    this.id,
    this.name,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
