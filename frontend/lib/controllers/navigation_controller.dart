import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/routing/routes.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  //Assign key to the navigator
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  //change screens
  Future<dynamic> navigateToWArgs(String routeName, dynamic arguments) {
    return navigationKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.popAndPushNamed(routeName);
  }

  Future<dynamic> navigateToEvent(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName).then((value) {
      navigationKey.currentState!.pop();
      navigationKey.currentState!.pop();
      navigationKey.currentState!.pushNamed(societyEventsPageDisplayName);
    });
  }

//THE EVENT OBJECT SHOULD BE RESET WHEN THE POPUP PAGE IS CLOSED SO THE USER CAN RESELECT A NEW EVENT TO
//VIEW THE DETAILS FOR
  Future<dynamic> navigateToPopupPage(String routeName) {
    return navigationKey.currentState!
        .popAndPushNamed(routeName)
        .then((result) {
      Get.delete<Event>();
      print('Event details page closed with result: $result');
    });
  }

  //go back
  goBack() => navigationKey.currentState!.pop();
}
