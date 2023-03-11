import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

// AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
//     leading: !(ResponsiveWidget.isSmallScreen(context) ||
//             ResponsiveWidget.isMediumScreen(context))
//         ? Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 14),
//                 child: Image.asset(
//                   "assets/icons/ticket.png",
//                   width: 28,
//                 ),
//               )
//             ],
//           )
//         : IconButton(
//             icon: Icon(Icons.menu, color: Colors.blueGrey),
//             onPressed: () {
//               key.currentState?.openDrawer();
//             },
//           ),
//     elevation: 0,
//     title: Row(
//       children: [
//         Visibility(
//             child: CustomText(
//           text: 'Uni Ticketing App',
//           colour: MyColours.active,
//           size: 20,
//           weight: FontWeight.bold,
//         )),
//         Expanded(child: Container()),
//         IconButton(
//           icon: Icon(Icons.home),
//           color: MyColours.dark.withOpacity(.7),
//           onPressed: () {},
//         ),
//         Stack(
//           children: [
//             IconButton(
//               icon: Icon(Icons.notifications),
//               color: MyColours.dark.withOpacity(.7),
//               onPressed: () {},
//             ),
//             Positioned(
//                 top: 7,
//                 right: 7,
//                 child: Container(
//                   width: 12,
//                   height: 12,
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                       color: MyColours.dark,
//                       border: Border.all(color: MyColours.dark, width: 2),
//                       borderRadius: BorderRadius.circular(20)),
//                 ))
//           ],
//         ),
//         Container(
//           width: 1,
//           height: 22,
//           color: MyColours.lightGrey,
//         ),
//         SizedBox(
//           width: 24,
//         ),
//         CustomText(text: "Santos Europe", colour: MyColours.dark),
//         SizedBox(
//           width: 16,
//         ),
//         Container(
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(30)),
//             child: Container(
//               padding: EdgeInsets.all(2),
//               margin: EdgeInsets.all(2),
//               child: CircleAvatar(
//                 backgroundColor: MyColours.light,
//                 child: Icon(
//                   Icons.person,
//                   color: MyColours.active,
//                 ),
//               ),
//             ))
//       ],
//     ),
//     iconTheme: IconThemeData(color: MyColours.dark),
//     backgroundColor: Colors.transparent,
//     actions: []);

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/ticket.png",
                    width: 28,
                  ),
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
                  color: MyColours.elementButtonColour,
                ),
                onPressed: () {}),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: MyColours.navbarColour.withOpacity(.7),
                    ),
                    onPressed: () {}),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: MyColours.active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: MyColours.light, width: 2)),
                  ),
                )
              ],
            ),
            Container(
              width: 1,
              height: 22,
              color: MyColours.elementButtonColour,
            ),
            const SizedBox(
              width: 24,
            ),
            const CustomText(
              text: "User",
              colour: MyColours.textColourDark,
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  color: MyColours.active.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                child: const CircleAvatar(
                  backgroundColor: MyColours.light,
                  child: Icon(
                    Icons.person_outline,
                    color: MyColours.dark,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: MyColours.navbarColour),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
