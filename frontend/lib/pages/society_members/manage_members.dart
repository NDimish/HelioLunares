import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:university_ticketing_system/globals.dart' as globals;

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});
  final int user_society_role_level = 3;
  final int society_id =
      6; // this is the user's role in society // this is user level, 1/2 for non/student and 3 for society account

  @override
  Widget build(BuildContext context) {
    if (user_society_role_level == 1) {
      return Center(
        child: Text(
            'You do not have enough power in this society (id=$society_id)!'),
      );
    } else if (user_society_role_level == 2 || user_society_role_level == 3) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => data.dataCollector<data.SocietyRole>(
                    filter: {'society': society_id.toString()},
                    order: data.OrderType.CHRONOLOGICAL))
          ],
          builder: (context, child) {
            final roleData =
                Provider.of<data.dataCollector<data.SocietyRole>>(context);

            return ListView(
              children: [
                const SizedBox(height: 40),
                const Text("Admins"),
                MembersTable(3, user_society_role_level,
                    globals.localdataobj.getUserLevel(), roleData.collection),
                const SizedBox(
                  height: 20,
                ),
                const Text("Local Admins"),
                MembersTable(2, user_society_role_level,
                    globals.localdataobj.getUserLevel(), roleData.collection),
                const SizedBox(
                  height: 20,
                ),
                const Text("Members"),
                MembersTable(1, user_society_role_level,
                    globals.localdataobj.getUserLevel(), roleData.collection),
              ],
            );
          });
    } else {
      return Center(
        child: Text('You have not joined this society (id=$society_id)'),
      );
    }
  }
}
