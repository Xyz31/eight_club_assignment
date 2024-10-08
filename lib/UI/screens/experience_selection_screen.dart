// /*
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project_eight_second/app_state/bloc/experience_bloc.dart';
import 'package:project_eight_second/UI/components/custom_card.dart';
import 'package:project_eight_second/UI/components/custom_shimmer.dart';
import 'package:project_eight_second/app_state/getx_controller/page_navigation_controller.dart';
import 'package:project_eight_second/utils/app_colors.dart';
import 'package:project_eight_second/utils/constants.dart';
import 'package:project_eight_second/utils/images_directory.dart';

class ExperienceSelectionScreen extends StatefulWidget {
  const ExperienceSelectionScreen({super.key});

  @override
  State<ExperienceSelectionScreen> createState() =>
      _ExperienceSelectionScreenState();
}

class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
  final TextEditingController controller = TextEditingController();
  final navigationController = Get.put(NavigationController());

  bool isKeyboardVisible = false;
  FocusNode focusNode = FocusNode();

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          buildHeader(context),
          // if (!_isKeyboardVisible) const Spacer(),
          // const SizedBox(height: 16),
          BlocBuilder<ExperienceBloc, ExperienceState>(
            builder: (context, state) {
              if (state is ExperienceLoading || state is ExperienceInitial) {
                return buildShimmerList();
              } else if (state is ExperienceLoaded) {
                return CustomCardsList(experiences: state.experiences);
              } else if (state is ExperienceError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          buildTextField(),
          const SizedBox(height: 16),
          buildNextButton(),
          const SizedBox(height: 24),
        ],
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
            '01',
            style: Style.spaceGrotesk(
              color: AppColors.text5,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'What kind of hotspots do you want to host?',
            maxLines: 3,
            style: Style.spaceGrotesk(
              color: AppColors.text1,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerList() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Row(
              children: [
                buildShimmerWidget(),
                const SizedBox(
                  width: 16,
                ),
              ],
            );
          }),
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
                maxLines: isKeyboardVisible ? 2 : 3,
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
                  if (navigationController.currentPage.value == 1) {
                    print("All Steps Completed");
                  } else {
                    navigationController.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    navigationController.goToNextPage(); // Move to next page
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
    );
  }
}
