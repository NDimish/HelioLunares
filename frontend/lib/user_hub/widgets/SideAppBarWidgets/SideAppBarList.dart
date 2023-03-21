import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_societies.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage_events.dart';

class SideAppBarList extends StatelessWidget {
  const SideAppBarList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero, children: [
          const DrawerHeader(child: Text("TickeX")),

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

        ]
    );
  }
}

// class SideAppBarList extends ListView {
//   SideAppBarList(BuildContext context, {super.key})
//       : super(padding: EdgeInsets.zero, children: [
//           const DrawerHeader(child: Text("TickeX")),

//           // Temporary solution until i figure out how to get functions working
//           ListTile(
//             leading: const Icon(Icons.calendar_month),
//             title: const Text("Show events"),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => UserHubPage_events()));
//             },
//           ),

//           ListTile(
//             leading: const Icon(Icons.group),
//             title: const Text("Show societies"),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => UserHubPage_societies()));
//             },
//           )

//         ]);
// }
