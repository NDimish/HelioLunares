import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
    leading: !(ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
        ? Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
                child: Image.asset(
                  "assets/icons/ticket.png",
                  width: 28,
                ),
              )
            ],
          )
        : IconButton(
            icon: Icon(Icons.menu, color: Colors.blueGrey),
            onPressed: () {
              key.currentState?.openDrawer();
            },
          ),
    elevation: 0,
    title: Row(
      children: [
        Visibility(
            child: CustomText(
          text: 'Uni Ticketing App',
          colour: Colors.grey,
          size: 20,
          weight: FontWeight.bold,
        )),
        Expanded(child: Container()),
        IconButton(
          icon: Icon(Icons.home),
          color: MyColours.dark.withOpacity(.7),
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              color: MyColours.dark.withOpacity(.7),
              onPressed: () {},
            ),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  //color: active,
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColours.light, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                ))
          ],
        ),
        Container(
          width: 1,
          height: 22,
          color: MyColours.lightGrey,
        ),
        SizedBox(
          width: 24,
        ),
        CustomText(text: "Santos Europe", colour: Colors.grey),
        SizedBox(
          width: 16,
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: MyColours.light,
                child: Icon(
                  Icons.percent_outlined,
                  color: MyColours.dark,
                ),
              ),
            ))
      ],
    ),
    iconTheme: IconThemeData(color: MyColours.dark),
    backgroundColor: Colors.transparent,
    actions: []);