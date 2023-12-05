// To parse this JSON data, do
//
//     final getDistrictsModel = getDistrictsModelFromJson(jsonString);

import 'dart:convert';

GetDistrictsModel getDistrictsModelFromJson(String str) =>
    GetDistrictsModel.fromJson(json.decode(str));

String getDistrictsModelToJson(GetDistrictsModel data) =>
    json.encode(data.toJson());

class GetDistrictsModel {
  final String? message;
  final List<Districts>? data;

  GetDistrictsModel({
    this.message,
    this.data,
  });

  factory GetDistrictsModel.fromJson(Map<String, dynamic> json) =>
      GetDistrictsModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Districts>.from(
                json["data"]!.map((x) => Districts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Districts {
  final int? id;
  final String? name;
  final int? stateId;

  Districts({
    this.id,
    this.name,
    this.stateId,
  });

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        id: json["id"],
        name: json["name"],
        stateId: json["stateId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stateId": stateId,
      };
}
