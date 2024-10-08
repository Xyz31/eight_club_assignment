import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentPage = 0.obs; // Observable to keep track of the current page
  var pageController = PageController();

  // Method to navigate to the next page
  void goToNextPage() {
    if (currentPage.value < 1) {
      currentPage.value++;
      pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeInCubic);
    }
  }

  // Method to navigate to the previous page
  void goToPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }
}
