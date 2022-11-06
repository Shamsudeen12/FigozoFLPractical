// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cats_response.g.dart';

@JsonSerializable()
class GetCatsResponse {
  @JsonKey(name: 'cats')
  List<PetModel> cats;

  GetCatsResponse({
    required this.cats,
  });

  factory GetCatsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCatsResponseToJson(this);
}
