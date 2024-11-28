import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../utils/helper.dart';

class LoanController extends GetxController {
  String repaymentSchedule = '';
  String paymentType = '';
  TextEditingController txtDate = TextEditingController();

  // Function to handle checkbox state change.
  void onChangedRepaymentSchedule(value) {
    repaymentSchedule = value!;
    update();
  }

  void onChangedPaymentType(value) {
    paymentType = value!;
    update();
  }
}
