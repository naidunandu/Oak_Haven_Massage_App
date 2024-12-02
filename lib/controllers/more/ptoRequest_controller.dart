import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/helper.dart';

class PTORequestController extends GetxController {
  String selectedOption = 'No';
  TextEditingController txtDate = TextEditingController();

  // Function to handle checkbox state change.
  void onChanged(value) {
    selectedOption = value!;
    update();
  }

  datePicker() async {
    Get.defaultDialog(
      title: "Select dates",
      barrierDismissible: false,
      onWillPop: () async => true,
      content: SizedBox(
        width: Get.width * 0.8,
        child: Helper().singleDatePicker(true),
      ),
    ).then((value) async {
      if (value != null) {
        txtDate.text = value;
        update();
      }
    });
  }
}
