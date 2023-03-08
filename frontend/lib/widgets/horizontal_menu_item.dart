//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/controllers/menu_controller.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
        onTap: onTap,
        // onHover: (value) {
        //   value
        //       ? menuController.onHover(itemName)
        //       : menuController.onHover("not hovering");
        // },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? MyColours.navButtonHoverColour.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 6,
                      height: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: _width / 88),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      colour: menuController.isHovering(itemName)
                          ? Colors.white
                          : MyColours.textColourLight,
                    ))
                  else
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      colour: Colors.white,
                      size: 18,
                      weight: FontWeight.bold,
                    ))
                ],
              ),
            )));
  }
}
