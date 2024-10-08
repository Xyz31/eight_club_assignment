import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project_eight_second/UI/components/custom_progress.dart';
import 'package:project_eight_second/app_state/bloc/experience_bloc.dart';
import 'package:project_eight_second/UI/screens/experience_selection_screen.dart';
import 'package:project_eight_second/UI/screens/onboarding_question_screen.dart';
import 'package:project_eight_second/app_state/getx_controller/page_navigation_controller.dart';
import 'package:project_eight_second/services/api_service.dart';
import 'package:project_eight_second/utils/images_directory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final experienceController = ExperienceController();
  runApp(MyApp(experienceController: experienceController));
}

class MyApp extends StatefulWidget {
  final ExperienceController experienceController;

  const MyApp({super.key, required this.experienceController});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationController = Get.put(NavigationController());
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExperienceBloc(widget.experienceController)
        ..add(LoadExperiencesEvent()),
      child: MaterialApp(
        title: 'Experience Selection App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                // Background Image
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    ImageDirectory.backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
                // PageView with two screens
                PageView(
                  controller: navigationController.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: const [
                    ExperienceSelectionScreen(), // First Screen
                    OnBoardingQuestionscreen() // Second Screen
                  ],
                ),

                // top progress
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: const Color(0x80101010),
                        ),
                        gradient: const RadialGradient(
                          colors: [
                            Color(0x66222222),
                            Color(0x66999999),
                            Color(0x66222222),
                          ],
                          stops: [0.0, 0.5, 1.0],
                          center: Alignment.center,
                          radius: 1.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                          child: InkWell(
                            onTap: () {
                              // Handle next button tap
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Obx(() => CustomProgressBar(
                                    currentPage:
                                        navigationController.currentPage.value,
                                    onBackPressed: () {
                                      if (navigationController
                                              .currentPage.value >
                                          0) {
                                        navigationController.pageController
                                            .previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                        navigationController
                                            .goToPreviousPage(); // Move to previous page
                                      }
                                    },
                                    onNextPressed: () {
                                      // if (navigationController
                                      //         .currentPage.value ==
                                      //     0) {
                                      //   navigationController.pageController
                                      //       .nextPage(
                                      //     duration:
                                      //         const Duration(milliseconds: 300),
                                      //     curve: Curves.easeInOut,
                                      //   );
                                      //   navigationController
                                      //       .goToNextPage();
                                      // }
                                    },
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
