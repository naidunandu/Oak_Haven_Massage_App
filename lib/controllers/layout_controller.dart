import 'package:get/get.dart';

class LayoutController extends GetxController {
  int currentPageIndex = 0;

  void updatePageIndex(int index, context) async {
    currentPageIndex = index;
    update();
  }
}
