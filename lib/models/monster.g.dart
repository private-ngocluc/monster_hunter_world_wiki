// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Monster _$MonsterFromJson(Map<String, dynamic> json) {
  return Monster(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$MonsterToJson(Monster instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
