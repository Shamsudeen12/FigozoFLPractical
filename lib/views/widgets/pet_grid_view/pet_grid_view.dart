import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:figozo_fl_practical/views/screens/details/pet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetGridView extends StatelessWidget {
  const PetGridView({
    Key? key,
    required this.pets,
  }) : super(key: key);

  final List<PetModel> pets;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        itemCount: pets.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(PetDetailsScreen(
                pet: pets[index],
              ));
            },
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Obx(
                        () => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFcfb3cd),
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                pets[index].photo,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          pets[index].name,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 16,
                          color: Color(0xFFcfb3cd),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
