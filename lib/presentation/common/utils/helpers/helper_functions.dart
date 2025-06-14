import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

abstract class HelperFunctions {
  static bool isDarkMode({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static void dismissAllDialogs(){
    if (Get.isDialogOpen ?? false) {
      print('islam from dismiss');
      Get.back(); 
      return;
    }

    print('islam outside dismiss');
  }
}
