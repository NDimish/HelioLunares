import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/controllers/side_menu_controller.dart';
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/edit_mode/edit_mode.dart';
import 'package:university_ticketing_system/pages/select_society/select_society_page.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'side_menu_item.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: MyColours.navbarColour.withOpacity(0.5),
      child: ListView(children: [
        if (ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(width: _width / 48),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),

                    // child: Image.asset("assets/icons/ticket.png"),
                  ),
                  const Flexible(
                    child: CustomText(
                      text: "University Ticketing App",
                      size: 20,
                      weight: FontWeight.bold,
                      colour: MyColours.elementButtonColour,
                    ),
                  ),
                  SizedBox(width: _width / 48),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        Divider(
          color: MyColours.navButtonColour.withOpacity(.1),
        ),
        Column(
          children: [
            SideMenuItem(
              itemName: selectSocietyPageDisplayName,
              onTap: () {
                //DELETE OLD SOCIETY SO CAN PUT A NEW ONE AFTER SOCIETY SELECTION
                Get.delete<Society>();
                //HIDE OTHER SUBPAGES WHEN A SOCIETY IS NOT SELECTED
                if ("/societyhub/SelectSociety" !=
                    ModalRoute.of(context)!.settings.name) {
                  sideMenuController.setInvisible();
                }
//UPDATE THE MENU CONTROLLER
                if (!menuController.isActive(selectSocietyPageDisplayName)) {
                  menuController
                      .changeActiveItemTo(selectSocietyPageDisplayName);
//NAVIGATE TO PAGE
                  navigationController.navigateTo(selectSocietyPageDisplayName);
                }
              },
            ),
            Obx(() => Visibility(
                //ONCE A SOCIETY IS SELECTED, SHOW ALL OTHER SUBPAGES
                //TODO - SHOW RELEVANT PAGES BASED ON MEMBER LEVEL
                visible: sideMenuController.menuItemsAreVisible.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItemRoutes
                      .map((item) => SideMenuItem(
                            onTap: () {
                              if (!menuController.isActive(item.name)) {
                                menuController.changeActiveItemTo(item.name);
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }

                                navigationController.navigateTo(item.name);
                              }
                            },
                            itemName: item.name,
                          ))
                      .toList(),
                )))
          ],
        )
      ]),
    );
  }
}
