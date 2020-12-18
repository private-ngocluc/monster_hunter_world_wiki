part of 'models.dart';

@JsonSerializable()
abstract class BaseModel {
  BaseModel();

  // use the modified "look for key" fromJson of BaseModel
  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json); // generated impl below

  // make subclasses implement toJson() to get its Map
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
