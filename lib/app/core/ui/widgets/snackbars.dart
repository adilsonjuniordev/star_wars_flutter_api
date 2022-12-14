import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbars {
  static void error(String title, String message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      messageText: Text(message),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red,
      colorText: Colors.black,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
