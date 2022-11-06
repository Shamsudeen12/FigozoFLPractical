import 'package:figozo_fl_practical/constants/breakpoints.dart';
import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:figozo_fl_practical/views/widgets/pet_details_section/pet_details_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < Breakpoint.tablet) {
          return Column(
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
                child: PetDetailsSection(pet: pet),
              )
            ],
          );
        } else {
          return Center(
            child: SizedBox(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).padding.top,
                          horizontal: 14,
                        ),
                        height: MediaQuery.of(context).size.height * .5,
                        decoration: BoxDecoration(
                          color: const Color(0xFFcfb3cd),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              pet.photo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: PetDetailsSection(pet: pet)),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
