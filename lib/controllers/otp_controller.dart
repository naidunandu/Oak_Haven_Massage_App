import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';
import 'package:oak_haven_massage_app/utils/toast.dart';

class OtpController extends GetxController {
  TextEditingController txtOtp = TextEditingController();
  FocusNode txtOtpFocus = FocusNode();
  bool isLoading = false;

  isLoadingStart() => isLoading = true..obs.update((val) => update());

  isLoadingStop() => isLoading = false..obs.update((val) => update());

  @override
  void onInit() {
    // TODO: implement onInit
    txtOtp.text = "11111";
    super.onInit();
  }


  verify() async {
    try {
      isLoadingStart();
     Get.toNamed(RouteNames.layout);
    } catch (e) {
      errorToast(e.toString());
    } finally {
      isLoadingStop();
    }
  }
}
