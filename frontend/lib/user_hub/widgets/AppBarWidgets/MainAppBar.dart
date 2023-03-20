import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/SocietyHubLink.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubTheme.dart';

import 'bought_tickets/user_bought_ticket_screen.dart';

class MainAppBar extends AppBar {
  MainAppBar(BuildContext context, Function(String)? searchfunc, Function()? clearfunc, TextEditingController? search_controller,{super.key})
      : super(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TickeX"), SizedBox(width: 30),
                CustomSearchBar(searchfunc, clearfunc, search_controller),
              ]),
            ),

            backgroundColor: const Color(0xff70587C),
            iconTheme: MainAppBarTheme(),
            titleTextStyle: MainAppBarTextTheme(),
            actions: [
              SocietyHubLink(),
              IconButton(
                tooltip: "View Tickets",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserBoughtTicketScreen()));
                  },
                  icon: const Icon(Icons.receipt)),
              IconButton(
                 tooltip: "Settings",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSettingsPage()));
                  },
                  icon: const Icon(Icons.settings))
            ]
            //
            );
}
