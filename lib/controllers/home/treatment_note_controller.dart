import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TreatmentNoteController extends GetxController {
  final Map<String, bool> selectedCheckboxes = {};
  final Map<String, String?> selectedRadios = {};

  Map<String, String> massage = {
    'Relaxing/Swedish': "false",
    'Therapeutic': "false",
    'Deep Tissue': "false",
    'Other': "false",
  };

  Map<String, String> pressure = {
    'Light': "false",
    'Deep': "false",
    'Medium/Firm': "false",
    'Other': "false",
  };

  Map<String, String> treatmentRecommendations = {
    'Per Week': "false",
    'Every Other Week': "false",
    'Monthly': "false",
    'As Needed': "false",
  };

  Map<String, String> sessionRecommended = {
    '25 Minutes': "false",
    '50 Minutes': "false",
    '80 Minutes': "false",
    '110 Minutes': "false",
  };

  final List<Map<String, dynamic>> areasOfFocus = [
    {
      'title': 'Full Body',
      'hasCheckbox': true,
      'hasRadios': false,
    },
    {
      'title': 'Upper Body',
      'hasCheckbox': true,
      'hasRadios': false,
    },
    {
      'title': 'Lower Body',
      'hasCheckbox': true,
      'hasRadios': false,
    },
    {
      'title': 'Face/Scalp',
      'hasCheckbox': true,
      'hasRadios': false,
    },
    {
      'title': 'Neck',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Shoulders',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Back',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R', 'U', 'L'],
    },
    {
      'title': 'Arms/Hands',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Hips',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Legs',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Fleet',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Glutes',
      'hasCheckbox': true,
      'hasRadios': true,
      'radioOptions': ['L', 'R'],
    },
    {
      'title': 'Other',
      'hasCheckbox': true,
      'hasRadios': false,
      'hasTextField': true,
    },
  ];

  String? selectedValue;

// Function to handle radio button selection.
  void onSelected(String? value) {
    selectedValue = value;
    update(); // Update the UI if using a state management approach like GetX, Provider, etc.
  }
}
