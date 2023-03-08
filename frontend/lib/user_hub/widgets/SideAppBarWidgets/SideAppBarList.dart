import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_societies.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';

class SideAppBarList extends ListView {
  SideAppBarList(BuildContext context, {super.key})
      : super(padding: EdgeInsets.zero, children: [
          const DrawerHeader(child: Text("Tickets For Two")),

          // Temporary solution until i figure out how to get functions working
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Show events"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserHubPage_events()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Show societies"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserHubPage_societies()));
            },
          )

          // SideAppBarListTile("Show events", Icons.calendar_month, (){
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));}),

          // SideAppBarListTile("Show societies", Icons.group,(){
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));
          // }),
        ]);
}
