import 'package:figozo_fl_practical/constants/breakpoints.dart';
import 'package:figozo_fl_practical/constants/strings.dart';
import 'package:figozo_fl_practical/views/screens/landing/controller/landing_controller.dart';
import 'package:figozo_fl_practical/views/widgets/pet_grid_view/pet_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  final controller = Get.put(LandingController())
    ..updateCatsList()
    ..updateDogsList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicatorColor: const Color(0xFFcfb3cd),
                      isScrollable: constraints.maxWidth >= Breakpoint.tablet
                          ? true
                          : false,
                      tabs: [
                        Tab(
                          text: AppStrings.cats.toUpperCase(),
                        ),
                        Tab(
                          text: AppStrings.dogs.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: Breakpoint.desktop,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: TabBarView(
                            children: [
                              Expanded(
                                child: PetGridView(pets: controller.cats),
                              ),
                              Expanded(
                                child: PetGridView(pets: controller.dogs),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
