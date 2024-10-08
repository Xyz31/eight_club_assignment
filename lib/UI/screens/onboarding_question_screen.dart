import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_eight_second/app_state/getx_controller/page_navigation_controller.dart';
import 'package:project_eight_second/utils/app_colors.dart';
import 'package:project_eight_second/utils/constants.dart';
import 'package:project_eight_second/utils/images_directory.dart';

class OnBoardingQuestionscreen extends StatefulWidget {
  const OnBoardingQuestionscreen({super.key});

  @override
  State<OnBoardingQuestionscreen> createState() =>
      _OnBoardingQuestionscreenState();
}

class _OnBoardingQuestionscreenState extends State<OnBoardingQuestionscreen> {
  final TextEditingController controller = TextEditingController();
  final navigationController = Get.put(NavigationController());

  bool isKeyboardVisible = false;
  FocusNode focusNode = FocusNode();

  void onchanged(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ImageDirectory.backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            buildHeader(context),

            buildTextField(),
            const SizedBox(
              height: 16,
            ),
            buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '02',
            style: Style.spaceGrotesk(
              color: AppColors.text5,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Why do you want to host with us?',
            maxLines: 3,
            style: Style.spaceGrotesk(
              color: AppColors.text1,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tell us about your intent and what motivates you to create experiences.',
            maxLines: 3,
            style: Style.spaceGrotesk(
              color: AppColors.text3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              color: Colors.white.withOpacity(0.05),
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: (value) {
                  setState(() {
                    isKeyboardVisible =
                        MediaQuery.of(context).viewInsets.bottom > 0;
                  });
                },
                style: Style.spaceGrotesk(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 6,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: '/ Describe your perfect hotspot',
                  hintStyle: Style.spaceGrotesk(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 0.8,
                    color: AppColors.text5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.voice_chat,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      decoration: BoxDecoration(color: AppColors.text5),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_camera_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 56,
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
                        if (navigationController.currentPage.value == 1) {
                          print("All Steps Completed");
                        } else {
                          navigationController.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          navigationController
                              .goToNextPage(); // Move to next page
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: Style.spaceGrotesk(
                                color: Colors.white.withOpacity(0.3),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 24,
                              child: Image.asset(
                                ImageDirectory.arrowRight,
                              ),
                            )
                          ],
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
    );
  }
}
