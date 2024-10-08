import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_eight_second/model/experiences.dart';
import 'package:project_eight_second/UI/components/custom_shimmer.dart';

import 'dart:math' as math;

class CustomCardsList extends StatefulWidget {
  final List<Experience> experiences;
  const CustomCardsList({super.key, required this.experiences});

  @override
  State<CustomCardsList> createState() => _CustomCardsListState();
}

class _CustomCardsListState extends State<CustomCardsList> {
  late List<Experience> sortedExperiences;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    sortedExperiences = List.from(widget.experiences);
    _sortExperiences();
  }

  void _sortExperiences() {
    sortedExperiences.sort((a, b) {
      if (a.isSelected && !b.isSelected) return -1;
      if (!a.isSelected && b.isSelected) return 1;
      return 0;
    });
    controller.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: sortedExperiences.length,
        itemBuilder: (context, index) {
          return buildExperienceCard(sortedExperiences[index]);
        },
      ),
    );
  }

  Widget buildExperienceCard(Experience experience) {
    final random = math.Random();
    final angle = (random.nextBool() ? 1 : -1) * random.nextDouble() * 0.09;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 100,
      height: 100,
      transform: Matrix4.rotationZ(angle),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: ClipRRect(
        child: CustomSelectableCard(
          experience: experience,
          onTap: () {
            setState(() {
              experience.isSelected = !experience.isSelected;
              _sortExperiences();
            });
          },
        ),
      ),
    );
  }
}

class CustomSelectableCard extends StatefulWidget {
  final Experience experience;
  final VoidCallback onTap;
  const CustomSelectableCard(
      {super.key, required this.experience, required this.onTap});

  @override
  State<CustomSelectableCard> createState() => _CustomSelectableCardState();
}

class _CustomSelectableCardState extends State<CustomSelectableCard> {
  int dots = 13;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: widget.experience.isSelected == true
          ? CachedNetworkImage(
              imageUrl: widget.experience.imageUrl,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => buildShimmerWidget(),
              fadeInDuration: const Duration(seconds: 3),
            )
          : SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Positioned.fill(
                          top: -99.3,
                          child: ListView.builder(
                            itemCount: dots,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      width: 3,
                                    ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  if (index < dots)
                                    const SizedBox(
                                      width: 3,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Positioned.fill(
                          bottom: -99.3,
                          child: ListView.builder(
                            itemCount: dots,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      width: 3,
                                    ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  if (index < dots)
                                    const SizedBox(
                                      width: 3,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Positioned.fill(
                          left: -99.3,
                          child: ListView.builder(
                            itemCount: dots,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      height: 3,
                                    ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  if (index < dots - 1)
                                    const SizedBox(
                                      height: 3,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Positioned.fill(
                          right: -99.3,
                          child: ListView.builder(
                            itemCount: dots,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  if (index == 0)
                                    const SizedBox(
                                      height: 3,
                                    ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  if (index < dots - 1)
                                    const SizedBox(
                                      height: 3,
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 86,
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: const BoxDecoration(color: Colors.grey),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned.fill(
                          top: 8,
                          child: Text(
                            widget.experience.name.toUpperCase(),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oswald().copyWith(
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 24,
                          bottom: 10,
                          child: SizedBox(
                            height: 54,
                            width: 54,
                            child: CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                              imageUrl: widget.experience.iconUrl,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
