import 'package:dartz/dartz.dart';
import 'package:figozo_fl_practical/core/apis/cats/get_cats_response.dart';
import 'package:figozo_fl_practical/core/apis/dogs/get_dogs_response.dart';
import 'package:figozo_fl_practical/core/models/failure/failure.dart';

abstract class PetsService {
  Future<Either<Failure, GetCatsResponse>> getCats();

  Future<Either<Failure, GetDogsResponse>> getDogs();
}
