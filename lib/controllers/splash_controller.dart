import 'package:get/get.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed(RouteNames.login);
    });
    super.onInit();
  }
}
