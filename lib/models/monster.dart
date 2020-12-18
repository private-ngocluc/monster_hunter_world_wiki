part of 'models.dart';

@JsonSerializable()
class Monster extends BaseModel {
  int id;
  String name;
  String description;
  String ecology;
  int weaknessFire;
  int weaknessWater;
  int weaknessBlast;
  int weaknessDragon;
  int weaknessIce;
  int weaknessParalysis;
  int weaknessPoison;
  int weaknessSleep;
  int weaknessStun;
  int weaknessThunder;

  Monster(
      {this.id,
      this.name,
      this.description,
      this.ecology,
      this.weaknessFire,
      this.weaknessWater,
      this.weaknessBlast,
      this.weaknessDragon,
      this.weaknessIce,
      this.weaknessParalysis,
      this.weaknessPoison,
      this.weaknessSleep,
      this.weaknessStun,
      this.weaknessThunder});

  String get monsterName => this.name;

  factory Monster.fromJson(Map<String, dynamic> json) =>
      _$MonsterFromJson(json);
  Map<String, dynamic> toJson() => _$MonsterToJson(this);
}
