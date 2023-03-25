// To parse this JSON data, do
//
//     final cardsModel = cardsModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'cards_model.g.dart';

List<CardsModel> cardsModelFromJson(String str) => List<CardsModel>.from(json.decode(str).map((x) => CardsModel.fromJson(x)));

String cardsModelToJson(List<CardsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class CardsModel {
  CardsModel({
    required this.cost,
    required this.name,
    required this.date,
    required this.number,
    required this.id,
  });

  @HiveField(1)
  String cost;
  @HiveField(2)
  String name;
  @HiveField(3)
  String date;
  @HiveField(4)
  String number;
  @HiveField(5)
  String id;

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
    cost: json["cost"],
    name: json["name"],
    date: json["date"],
    number: json["number"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cost": cost,
    "name": name,
    "date": date,
    "number": number,
    "id": id,
  };
}
