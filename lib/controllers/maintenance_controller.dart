import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MaintenanceController extends GetxController {
  // Initialize a map to track the selected state of each checkbox.
  Map<String, bool> selection = {
    'Fan': false,
    'Heater': false,
    'Heating Pad': false,
    'Table is Loose': false,
    'Other': false,
  };

  // Function to handle checkbox state change.
  void onChanged(bool? value, String key) {
    selection[key] = value!;
    update();
  }
}
