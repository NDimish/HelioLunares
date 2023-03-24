import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/controllers/navigation_controller.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart'
    as menu;
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/routing/router.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import '../backend_communication/models/Event.dart';
import '../controllers/side_menu_controller.dart';
import '../controllers/navigation_controller.dart' as nav;

class DeleteAllObjects {
  //Delete all objects & reset navigation controllers
  void delete() {
    Get.delete<Event>();
    Get.delete<Society>();
    menuController.changeActiveItemTo(selectSocietyPageDisplayName);
    sideMenuController.setLevelThreeMenuItemsInvisible();
    sideMenuController.setLevelTwoMenuItemsInvisible();
  }
}
