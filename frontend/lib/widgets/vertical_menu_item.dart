import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:get/get.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("Not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? MyColours.navButtonHoverColour.withOpacity(.1)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: MyColours.navButtonColour,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        colour: menuController.isHovering(itemName)
                            ? MyColours.elementButtonHoverColour
                            : MyColours.elementButtonColour,
                      ),
                    )
                  else
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        colour: MyColours.navButtonColour,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    )
                ],
              ))
            ]),
          )),
    );
  }
}
