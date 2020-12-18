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
    weaknessFire: json['weaknessFire'] as int,
    weaknessWater: json['weaknessWater'] as int,
    weaknessBlast: json['weaknessBlast'] as int,
    weaknessDragon: json['weaknessDragon'] as int,
    weaknessIce: json['weaknessIce'] as int,
    weaknessParalysis: json['weaknessParalysis'] as int,
    weaknessPoison: json['weaknessPoison'] as int,
    weaknessSleep: json['weaknessSleep'] as int,
    weaknessStun: json['weaknessStun'] as int,
    weaknessThunder: json['weaknessThunder'] as int,
  );
}

Map<String, dynamic> _$MonsterToJson(Monster instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ecology': instance.ecology,
      'weaknessFire': instance.weaknessFire,
      'weaknessWater': instance.weaknessWater,
      'weaknessBlast': instance.weaknessBlast,
      'weaknessDragon': instance.weaknessDragon,
      'weaknessIce': instance.weaknessIce,
      'weaknessParalysis': instance.weaknessParalysis,
      'weaknessPoison': instance.weaknessPoison,
      'weaknessSleep': instance.weaknessSleep,
      'weaknessStun': instance.weaknessStun,
      'weaknessThunder': instance.weaknessThunder,
    };
