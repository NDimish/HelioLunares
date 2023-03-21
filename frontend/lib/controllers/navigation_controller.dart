import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  //Assign key to the navigator
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  //change screens
  Future<dynamic> navigateToWArgs(String routeName, dynamic arguments) {
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  //go back
  goBack() => navigationKey.currentState!.pop();
}
