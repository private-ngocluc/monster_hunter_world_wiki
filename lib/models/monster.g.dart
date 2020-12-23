// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Monster _$MonsterFromJson(Map<String, dynamic> json) {
  return Monster(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    ecology: json['ecology'] as String,
    weaknessFire: json['weakness_fire'] as int,
    weaknessWater: json['weakness_water'] as int,
    weaknessBlast: json['weakness_blast'] as int,
    weaknessDragon: json['weakness_dragon'] as int,
    weaknessIce: json['weakness_ice'] as int,
    weaknessParalysis: json['weakness_paralysis'] as int,
    weaknessPoison: json['weakness_poison'] as int,
    weaknessSleep: json['weakness_sleep'] as int,
    weaknessStun: json['weakness_stun'] as int,
    weaknessThunder: json['weakness_thunder'] as int,
  );
}

Map<String, dynamic> _$MonsterToJson(Monster instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ecology': instance.ecology,
      'weakness_fire': instance.weaknessFire,
      'weakness_water': instance.weaknessWater,
      'weakness_blast': instance.weaknessBlast,
      'weakness_dragon': instance.weaknessDragon,
      'weakness_ice': instance.weaknessIce,
      'weakness_paralysis': instance.weaknessParalysis,
      'weakness_poison': instance.weaknessPoison,
      'weakness_sleep': instance.weaknessSleep,
      'weakness_stun': instance.weaknessStun,
      'weakness_thunder': instance.weaknessThunder,
    };
