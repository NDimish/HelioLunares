import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

import '../../helpers/responsiveness.dart';

class EditModePage extends StatelessWidget {
  const EditModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Flexible(
            child: Container(
          height: 50,
        )),
        Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 20,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                  color: MyColours.elementButtonColour)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColours.elementButtonHoverColour),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MyColours.panelBackgroundColour),
                      ),
                      // ignore: prefer_const_constructors
                      child: CustomText(
                        weight: FontWeight.w300,
                        text: "Edit Hub Page Details",
                        size: 20,
                      ),
                      onPressed: () {
                        navigationController
                            .navigateTo(editSocietyHubPageDisplayName);
                      }),
                ),
                Flexible(
                    child: Container(
                  height: 20,
                )),
                Expanded(
                  flex: 20,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              // ignore: prefer_const_constructors
                              side: BorderSide(
                                  color: MyColours.elementButtonColour)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColours.elementButtonHoverColour),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MyColours.panelBackgroundColour),
                      ),
                      // ignore: prefer_const_constructors
                      child: CustomText(
                        weight: FontWeight.w300,
                        text: "Edit Society Details",
                        size: 20,
                      ),
                      onPressed: () {}),
                ),
                Flexible(
                    child: Container(
                  height: 5,
                )),
              ],
            ))
      ],
    );
  }
}
