import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top,
              horizontal: 14,
            ),
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              color: const Color(0xFFcfb3cd),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  pet.photo,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF051923),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailBlock(
                        title: 'Age',
                        value: pet.age.toString(),
                      ),
                      DetailBlock(
                        title: 'Weight',
                        value: '${pet.weight}kg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    pet.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailBlock extends StatelessWidget {
  const DetailBlock({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF051923),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xFF051923),
            ),
          ),
        ],
      ),
    );
  }
}
