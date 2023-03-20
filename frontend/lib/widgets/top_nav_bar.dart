import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  // child: Image.asset(
                  //   "assets/icons/ticket.png",
                  //   width: 28,
                  // ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      title: Container(
        child: Row(
          children: [
            Visibility(
                visible: !(ResponsiveWidget.isSmallScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context)),
                child: const CustomText(
                  text: "Ticket App",
                  colour: MyColours.textColourLight,
                  size: 18,
                  weight: FontWeight.bold,
                )),
            Expanded(child: Container()),
            IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: MyColours.navbarColour,
                ),
                onPressed: () {
                  navigationController
                      .navigateTo(societySettingsPageDisplayName);
                }),
            Container(
              width: 1,
              height: 22,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent)),
                onPressed: () {
                  //Go to user hub
                },
                child: const CustomText(
                  text: "Go to User Hub",
                  colour: MyColours.navbarColour,
                )),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: MyColours.navbarColour),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
