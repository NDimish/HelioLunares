import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';

import '../widgets/side_menu_item.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find<SideMenuController>();
  var activeItem = menuController.activeItem.obs;
  late final List<SideMenuItem> sideMenuItemList;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;
}
