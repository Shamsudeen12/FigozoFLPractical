// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dogs_response.g.dart';

@JsonSerializable()
class GetDogsResponse {
  @JsonKey(name: 'dogs')
  List<PetModel> dogs;

  GetDogsResponse({
    required this.dogs,
  });

  factory GetDogsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDogsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDogsResponseToJson(this);
}
