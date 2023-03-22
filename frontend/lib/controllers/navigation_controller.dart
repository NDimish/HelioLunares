import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';

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

//THE EVENT OBJECT SHOULD BE RESET WHEN THE POPUP PAGE IS CLOSED SO THE USER CAN RESELECT A NEW EVENT TO
//VIEW THE DETAILS FOR
  Future<dynamic> navigateToPopupPage(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName).then((result) {
      Get.delete<Event>();
      print('Event details page closed with result: $result');
    });
  }

  //go back
  goBack() => navigationKey.currentState!.pop();
}
