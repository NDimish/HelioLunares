import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find<MenuController>();
  var activeItem = societyHubPageDisplayName.obs;

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
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: MyColours.dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? MyColours.dark : MyColours.lightGrey,
    );
  }
}
// class MenuController extends GetxController {
//   static MenuController instance = Get.find();

//   var activeItem = OverViewPageRoute.obs;

//   var hoverItem = "".obs;

//   changeActiveItemTo(String itemName) {
//     activeItem.value = itemName;
//   }

//   onHover(String itemName) {
//     if (!isActive(itemName)) hoverItem.value = itemName;
//   }

//   isActive(String itemName) => hoverItem.value == itemName;

//   Widget returnIconFor(String itemName) {
//     switch (itemName) {
//       case OverViewPageRoute:
//         return _customIcon(Icons.trending_up, itemName);
//       case societyEventsPageRoute:
//         return _customIcon(Icons.drive_eta, itemName);
//       case statisticsPageRoute:
//         return _customIcon(Icons.people_alt_outlined, itemName);
//       case editModePageRoute:
//         return _customIcon(Icons.exit_to_app, itemName);
//       default:
//         return _customIcon(Icons.exit_to_app, itemName);
//     }
//   }

//   Widget _customIcon(IconData icon, String itemName) {
//     if (isActive(itemName)) return Icon(icon, size: 24, color: MyColours.dark);
//     return Icon(icon,
//         color: isHovering(itemName) ? MyColours.dark : MyColours.lightGrey);
//   }

//   isHovering(String itemName) => hoverItem.value == itemName;
// }
