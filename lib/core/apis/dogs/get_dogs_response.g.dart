// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dogs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDogsResponse _$GetDogsResponseFromJson(Map<String, dynamic> json) =>
    GetDogsResponse(
      dogs: (json['dogs'] as List<dynamic>)
          .map((e) => PetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDogsResponseToJson(GetDogsResponse instance) =>
    <String, dynamic>{
      'dogs': instance.dogs,
    };
