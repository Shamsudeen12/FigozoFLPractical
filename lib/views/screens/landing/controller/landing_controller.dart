import 'package:dartz/dartz.dart';
import 'package:figozo_fl_practical/core/apis/cats/get_cats_response.dart';
import 'package:figozo_fl_practical/core/apis/dogs/get_dogs_response.dart';
import 'package:figozo_fl_practical/core/models/failure/failure.dart';
import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:figozo_fl_practical/core/services/pets_service.dart';
import 'package:figozo_fl_practical/core/services/pets_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LandingController extends GetxController {
  final dogs = <PetModel>[].obs;

  final cats = <PetModel>[].obs;

  final storageController = GetStorage();

  final PetsService _petsService = Get.put(PetsServiceImpl());

  updateDogsList() async {
    Either<Failure, GetDogsResponse> response = await _petsService.getDogs();

    response.fold((failure) {
      List<PetModel> localDogs = storageController.read('dogs') ?? [];

      dogs(localDogs);

      Get.snackbar(
        failure.message,
        'You\'re currently viewing local data',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }, (result) {
      storageController.write('dogs', result.dogs);

      dogs(result.dogs);
    });
  }

  updateCatsList() async {
    Either<Failure, GetCatsResponse> response = await _petsService.getCats();

    response.fold((failure) {
      List<PetModel> localCats = storageController.read('cats') ?? [];

      cats(localCats);

      Get.snackbar(
        failure.message,
        'You\'re currently viewing local data',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }, (result) {
      storageController.write('cats', result.cats);

      cats(result.cats);
    });
  }
}
