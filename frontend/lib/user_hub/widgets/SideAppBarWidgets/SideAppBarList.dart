import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_societies.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';

class SideAppBarList extends StatelessWidget {
  const SideAppBarList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero, children: [
          const DrawerHeader(child: Text("TickeX")),
          SideAppBarListTile(optionName: "Show events", iconname: Icons.calendar_month, input:UserHubPage_events()),
          SideAppBarListTile(optionName: "Show societies", iconname: Icons.group, input:UserHubPage_societies()),

        ]
    );
  }
}

