import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alertBoxError(String message) => Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 100),
      backgroundColor: const Color(0xFFEC53B0).withOpacity(.5),
      colorText: const Color(0xFF040D12),
      padding: const EdgeInsets.all(15),
    );

void alertBoxWarning(String message) => Get.snackbar(
      "Warrning",
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 100),
      backgroundColor: const Color(0xFFFFC436).withOpacity(.5),
      colorText: const Color(0xFF040D12),
      padding: const EdgeInsets.all(15),
    );

void alertBoxSuccess(String message) => Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 100),
      backgroundColor: const Color(0xFF33BBC5).withOpacity(.5),
      colorText: const Color(0xFF040D12),
      padding: const EdgeInsets.all(15),
    );
