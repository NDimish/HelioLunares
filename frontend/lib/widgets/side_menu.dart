import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/widgets/horizontal_menu_item.dart';
import 'package:university_ticketing_system/widgets/vertical_menu_item.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: MyColours.light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/ticket.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        text: "University Ticketing App",
                        size: 20,
                        weight: FontWeight.bold,
                        colour: MyColours.active,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: MyColours.lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName:
                        item.name == editModePageRoute ? "Log Out" : item.name,
                    onTap: () {
                      if (item.name == editModePageRoute) {
                        //todo
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.name);
                      }

                      //   if (item.route == editModePageRoute) {
                      //     Get.offAllNamed(editModePageRoute);
                      //     menuController
                      //         .changeActiveItemTo(overviewPageDisplayName);
                      //   }
                      //   if (!menuController.isActive(item.name)) {
                      //     menuController.changeActiveItemTo(item.name);
                      //     if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                      //     //navigationController.navigateTo(item.route);
                      //   }
                      // })
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
