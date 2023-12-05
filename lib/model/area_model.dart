// To parse this JSON data, do
//
//     final getAreaModel = getAreaModelFromJson(jsonString);

import 'dart:convert';

GetAreaModel getAreaModelFromJson(String str) =>
    GetAreaModel.fromJson(json.decode(str));

String getAreaModelToJson(GetAreaModel data) => json.encode(data.toJson());

class GetAreaModel {
  final String? message;
  final List<Datum>? data;

  GetAreaModel({
    this.message,
    this.data,
  });

  factory GetAreaModel.fromJson(Map<String, dynamic> json) => GetAreaModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? name;
  final int? districtId;

  Datum({
    this.id,
    this.name,
    this.districtId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        districtId: json["districtId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "districtId": districtId,
      };
}
