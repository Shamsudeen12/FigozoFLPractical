// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCatsResponse _$GetCatsResponseFromJson(Map<String, dynamic> json) =>
    GetCatsResponse(
      cats: (json['cats'] as List<dynamic>)
          .map((e) => PetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCatsResponseToJson(GetCatsResponse instance) =>
    <String, dynamic>{
      'cats': instance.cats,
    };
