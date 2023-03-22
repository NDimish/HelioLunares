import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:university_ticketing_system/globals.dart' as globals;

class ManageMembers extends StatefulWidget {
  final int societyId;
  const ManageMembers({required this.societyId, super.key});

  @override
  State<ManageMembers> createState() => _ManageMembersState();
}

class _ManageMembersState extends State<ManageMembers> {
  var x = 0;
  var roleData;
  // this is the user's role in society // this is user level, 1/2 for non/student and 3 for society account
  void callback(int test) {
    setState(() {
      print("YOOO WHAT IS THIS");
      print(roleData.collection[0].role);
      this.x = test;
    });
  }

  @override
  Widget build(BuildContext context) {
    int userSocietyRoleLevel = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) =>
                    data.dataCollector<data.SocietyRole>(filter: {
                      'society': widget.societyId.toString(),
                    }, order: data.OrderType.CHRONOLOGICAL))
          ],
          builder: (context, child) {
            roleData =
                Provider.of<data.dataCollector<data.SocietyRole>>(context);
            print("Test1");
            print(roleData.collection[0].role);
            print("Test2");
            //now check user role level first
            if (globals.localdataobj.getToken() == "") {
              return const Text("You have not been authenticated.");
            }

            if (globals.localdataobj.getUserLevel() != 3) {
              //check in the array if they are in soc and have power
              for (var i = 0; i < roleData.collection.length; i++) {
                if (roleData.collection[i].people.user.id ==
                    globals.localdataobj.getUserID()) {
                  userSocietyRoleLevel = roleData.collection[i].role;
                  break;
                }
              }
              if (userSocietyRoleLevel == 1) {
                return const Text("You do not have power in society.");
              }
              if (userSocietyRoleLevel == 0) {
                return const Text("You are not part of this society.");
              }
            }

            //They have enough power to be in this society management

            return ListView(
              children: [
                const SizedBox(height: 40),
                const Text("Admins"),
                MembersTable(
                    3,
                    userSocietyRoleLevel,
                    globals.localdataobj.getUserLevel(),
                    widget.societyId,
                    roleData.collection,
                    callback),
                const SizedBox(
                  height: 20,
                ),
                const Text("Local Admins"),
                MembersTable(
                    2,
                    userSocietyRoleLevel,
                    globals.localdataobj.getUserLevel(),
                    widget.societyId,
                    roleData.collection,
                    callback),
                const SizedBox(
                  height: 20,
                ),
                const Text("Members"),
                MembersTable(
                    1,
                    userSocietyRoleLevel,
                    globals.localdataobj.getUserLevel(),
                    widget.societyId,
                    roleData.collection,
                    callback),
              ],
            );
          }),
    );
  }
}
