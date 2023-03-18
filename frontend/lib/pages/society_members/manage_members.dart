import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});
  final int user_society_role_level = 2;
  final int society_id = 1;

  @override
  Widget build(BuildContext context) {
    if (user_society_role_level == 1) {
      return Center(
        child: Text(
            'You do not have enough power in this society (id=$society_id)!'),
      );
    } else if (user_society_role_level == 2 || user_society_role_level == 3) {
      return Column(
        children: const [
          SizedBox(height: 40),
          Text("Admins"),
          MembersTable(3),
          SizedBox(
            height: 20,
          ),
          Text("Local Admins"),
          MembersTable(2),
          SizedBox(
            height: 20,
          ),
          Text("Members"),
          MembersTable(1),
        ],
      );
    } else {
      return Center(
        child: Text('You have not joined this society (id=$society_id)'),
      );
    }
  }
}
