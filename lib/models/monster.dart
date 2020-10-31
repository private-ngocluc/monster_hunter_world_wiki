import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:monster_hunter_world_wiki/models/models.dart';

part 'monster.g.dart';

@JsonSerializable()
class Monster extends BaseModel {
  int id;
  String name;
  String description;

  Monster({
    this.id,
    this.name,
    this.description,
  });

  String get monsterName => this.name;

  factory Monster.fromJson(Map<String, dynamic> json) =>
      _$MonsterFromJson(json);
  Map<String, dynamic> toJson() => _$MonsterToJson(this);
}
