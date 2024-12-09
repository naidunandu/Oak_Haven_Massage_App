import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/network/api_manager.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';
import 'package:oak_haven_massage_app/utils/helper.dart';
import 'package:oak_haven_massage_app/utils/toast.dart';

import '../../models/network_response.dart';
import '../../utils/endpoints.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  FocusNode txtEmailFocus = FocusNode();
  bool isLoading = false;

  isLoadingStart() => isLoading = true..obs.update((val) => update());

  isLoadingStop() => isLoading = false..obs.update((val) => update());

  @override
  void onInit() {
    // TODO: implement onInit
    txtEmail.text = "Nandini@gmail.com";
    super.onInit();
  }

  signIn() async {
    try {
      if (Helper().isEmailValidation(txtEmail.text) == true) {
        isLoadingStart();
        Map<String, String> request = {
          "phone": "",
          "phonewithCountryCode": ""
        };
        APIResponse response = await ApiManager().call(Endpoints.login, request, ApiType.post);
        if(response.success){
          Get.toNamed(RouteNames.otp);
        }
      } else {
        txtEmail.text = "";
        update();
      }
    } catch (e) {
      errorToast(e.toString());
    } finally {
      isLoadingStop();
    }
  }
}

