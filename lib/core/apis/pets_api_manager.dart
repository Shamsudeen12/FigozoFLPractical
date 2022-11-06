import 'package:dio/dio.dart';
import 'package:figozo_fl_practical/constants/app_constants.dart';
import 'package:figozo_fl_practical/core/apis/cats/get_cats_response.dart';
import 'package:figozo_fl_practical/core/apis/dogs/get_dogs_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'pets_api_manager.g.dart';

@LazySingleton()
@RestApi(baseUrl: AppConstants.baseUrl)
abstract class PetsApiManager {
  @GET(AppConstants.catsEndpoint)
  Future<GetCatsResponse> getCats();

  @GET(AppConstants.dogsEndpoint)
  Future<GetDogsResponse> getDogs();

  @factoryMethod
  static PetsApiManager create() {
    final client = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveTimeout: 60000,
      connectTimeout: 60000,
      sendTimeout: 60000,
    ));

    return _PetsApiManager(client);
  }
}
