import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find<MenuController>();
  var activeItem = selectSocietyPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case societyHubPageDisplayName:
        return _customIcon(Icons.group, itemName);
      case societyEventsPageDisplayName:
        return _customIcon(Icons.event, itemName);
      case statisticsPageDisplayName:
        return _customIcon(Icons.auto_graph_outlined, itemName);
      case editModePageDisplayName:
        return _customIcon(Icons.edit, itemName);
      case editSocietyMembersPageDisplayName:
        return _customIcon(Icons.group, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(icon, size: 22, color: MyColours.elementButtonColour);

    return Icon(
      icon,
      color: isHovering(itemName)
          ? MyColours.navButtonHoverColour
          : MyColours.navButtonColour,
    );
  }
}
