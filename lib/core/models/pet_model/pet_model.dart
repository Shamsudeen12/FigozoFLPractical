import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class PetModel {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'age')
  int age;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'description')
  String description;

  PetModel({
    required this.name,
    required this.photo,
    required this.age,
    required this.weight,
    required this.description,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
