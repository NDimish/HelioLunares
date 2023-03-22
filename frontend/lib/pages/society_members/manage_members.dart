import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: 40),
        CustomText(
          text: "Admins",
          weight: FontWeight.bold,
          size: 20,
        ),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        CustomText(
          text: "Local Admins",
          weight: FontWeight.bold,
          size: 20,
        ),
        MembersTable(),
        SizedBox(
          height: 20,
        ),
        CustomText(
          text: "Members",
          weight: FontWeight.bold,
          size: 20,
        ),
        MembersTable(),
      ],
    );
  }
}
