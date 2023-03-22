import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';

import '../widgets/side_menu_item.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find<SideMenuController>();
  var menuItemsAreVisible = false.obs;

  void setVisible() {
    menuItemsAreVisible.value = true;
  }

  void setInvisible() {
    menuItemsAreVisible.value = false;
  }
}
