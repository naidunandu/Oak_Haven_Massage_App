import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  int currentPageIndex = 0;

  // Update page index method
  updatePageIndex(int index) {
    currentPageIndex = index;
    update();
  }

  bool isMenuOpen = false;
}
