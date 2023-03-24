import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';

import '../widgets/side_menu_item.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find<SideMenuController>();
  var levelTwoMenuItemsAreVisible = false.obs;
  var levelThreeMenuItemsAreVisible = false.obs;
  var selectSocietyMenuItemIsVisible = true.obs;

  void setSelectSocietyVisible() {
    selectSocietyMenuItemIsVisible.value = true;
  }

  void setSelectSocietyInvisible() {
    selectSocietyMenuItemIsVisible.value = false;
  }

  void setLevelTwoMenuItemsVisible() {
    levelTwoMenuItemsAreVisible.value = true;
  }

  void setLevelTwoMenuItemsInvisible() {
    levelTwoMenuItemsAreVisible.value = false;
  }

  void setLevelThreeMenuItemsVisible() {
    levelThreeMenuItemsAreVisible.value = true;
  }

  void setLevelThreeMenuItemsInvisible() {
    levelThreeMenuItemsAreVisible.value = false;
  }
}
