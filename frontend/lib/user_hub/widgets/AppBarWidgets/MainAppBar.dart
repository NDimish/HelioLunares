import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubThemes.dart';

import 'bought_tickets/user_bought_ticket_screen.dart';

class MainAppBar extends AppBar {
  MainAppBar(BuildContext context)
      : super(
            title: Text("TickEX"),
            backgroundColor: Color(0xff70587C),
            iconTheme: MainAppBarTheme(),
            titleTextStyle: MainAppBarTextTheme(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserBoughtTicketScreen()));
                  },
                  icon: Icon(Icons.receipt)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSettingsPage()));
                  },
                  icon: Icon(Icons.settings))
            ]
            //
            );
}
