// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) => PetModel(
      name: json['name'] as String,
      photo: json['photo'] as String,
      age: json['age'] as int,
      weight: json['weight'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'age': instance.age,
      'weight': instance.weight,
      'description': instance.description,
    };
