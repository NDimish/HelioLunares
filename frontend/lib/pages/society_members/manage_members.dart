import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});
  final int user_society_role_level = 3;
  final int society_id = 1; // this is the user's role in society
  final int user_level =
      1; // this is user level, 1/2 for non/student and 3 for society account

  @override
  Widget build(BuildContext context) {
    if (user_society_role_level == 1) {
      return Center(
        child: Text(
            'You do not have enough power in this society (id=$society_id)!'),
      );
    } else if (user_society_role_level == 2 || user_society_role_level == 3) {
      return Column(
        children: [
          const SizedBox(height: 40),
          const Text("Admins"),
          MembersTable(3, user_society_role_level, user_level),
          const SizedBox(
            height: 20,
          ),
          const Text("Local Admins"),
          MembersTable(2, user_society_role_level, user_level),
          const SizedBox(
            height: 20,
          ),
          const Text("Members"),
          MembersTable(1, user_society_role_level, user_level),
        ],
      );
    } else {
      return Center(
        child: Text('You have not joined this society (id=$society_id)'),
      );
    }
  }
}
