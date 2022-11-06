import 'package:figozo_fl_practical/core/models/pet_model/pet_model.dart';
import 'package:figozo_fl_practical/views/widgets/detail_block/detail_block.dart';
import 'package:flutter/material.dart';

class PetDetailsSection extends StatelessWidget {
  const PetDetailsSection({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
