import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:university_ticketing_system/constants/controllers.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/helpers/local_navigator.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/routing/routes.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';
import 'package:university_ticketing_system/globals.dart' as globals;

import '../backend_communication/authenticate.dart';
import '../helpers/deleteAllObjects.dart';
import '../home/homepage.dart';

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key,
        bool? societySelected) =>
    AppBar(
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
            //LOGOUT BUTTON
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent)),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/");

                  logout();
                  // Get.offAndToNamed('/');
                  DeleteAllObjects d = DeleteAllObjects();
                  d.delete();
                },
                child: const CustomText(
                  text: "Log Out",
                  colour: MyColours.navbarColour,
                )),
            societySelected!
                ? IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: MyColours.navbarColour,
                    ),
                    onPressed: () {
                      navigationController
                          .navigateTo(societySettingsPageDisplayName);
                    })
                : Container(),
            Container(
              width: 1,
              height: 22,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            (globals.localdataobj.getUserLevel() != 3)
                ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      //Go to user hub
                      Navigator.popAndPushNamed(context, '/userhub');
                    },
                    child: const CustomText(
                      text: "Back to User Hub",
                      colour: MyColours.navbarColour,
                    ))
                : const Text(""),
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
