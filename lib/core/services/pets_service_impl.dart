import 'dart:io';

import 'package:figozo_fl_practical/core/apis/pets_api_manager.dart';
import 'package:figozo_fl_practical/core/models/failure/failure.dart';
import 'package:figozo_fl_practical/core/apis/dogs/get_dogs_response.dart';
import 'package:figozo_fl_practical/core/apis/cats/get_cats_response.dart';
import 'package:dartz/dartz.dart';
import 'package:figozo_fl_practical/core/services/pets_service.dart';
import 'package:get/instance_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PetsServiceImpl extends PetsService {
  final PetsApiManager _petsApiManager = Get.put(PetsApiManager.create());

  Future<GetCatsResponse> _getCats() async {
    try {
      final response = await _petsApiManager.getCats();

      return response;
    } on SocketException {
      throw Failure(Failure.socketExceptionMsg, Failure.socketExceptionCode);
    } on FormatException {
      throw Failure(Failure.formatExceptionMsg, Failure.formatExceptionCode);
    } on HttpException {
      throw Failure(Failure.httpExceptionMsg, Failure.httpExceptionCode);
    } catch (err) {
      throw Failure(
          Failure.somethingWentWrongMsg, Failure.somethingWentWrongCode);
    }
  }

  @override
  Future<Either<Failure, GetCatsResponse>> getCats() async {
    final Either<Failure, GetCatsResponse> result = await Task(() => _getCats())
        .attempt()
        .map(
          (either) => either.leftMap(
            (obj) {
              try {
                return obj as Failure;
              } catch (err) {
                throw obj;
              }
            },
          ),
        )
        .run();

    return result;
  }

  Future<GetDogsResponse> _getDogs() async {
    try {
      final response = await _petsApiManager.getDogs();

      return response;
    } on SocketException {
      throw Failure(Failure.socketExceptionMsg, Failure.socketExceptionCode);
    } on FormatException {
      throw Failure(Failure.formatExceptionMsg, Failure.formatExceptionCode);
    } on HttpException {
      throw Failure(Failure.httpExceptionMsg, Failure.httpExceptionCode);
    } catch (err) {
      throw Failure(
          Failure.somethingWentWrongMsg, Failure.somethingWentWrongCode);
    }
  }

  @override
  Future<Either<Failure, GetDogsResponse>> getDogs() async {
    final Either<Failure, GetDogsResponse> result = await Task(() => _getDogs())
        .attempt()
        .map(
          (either) => either.leftMap(
            (obj) {
              try {
                return obj as Failure;
              } catch (err) {
                throw obj;
              }
            },
          ),
        )
        .run();

    return result;
  }
}
