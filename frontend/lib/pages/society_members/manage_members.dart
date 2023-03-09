import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 40),
        Text("Inner Circle"),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        Text("committee"),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        Text("Members"),
        MembersTable(),
      ],
    );
  }
}
