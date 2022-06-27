import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  void changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}
