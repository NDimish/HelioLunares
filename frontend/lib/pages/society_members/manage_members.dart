import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';

import '../../helpers/responsiveness.dart';

class ManageMembers extends StatelessWidget {
  const ManageMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.white.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Admins",
                style: TextStyle(
                    fontFamily: "Arvo",
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 24 : 40),
              ),
              MembersTable(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Local Admins",
                style: TextStyle(
                    fontFamily: "Arvo",
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 24 : 40),
              ),
              MembersTable(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Members",
                style: TextStyle(
                    fontFamily: "Arvo",
                    fontSize:
                        ResponsiveWidget.isSmallScreen(context) ? 24 : 40),
              ),
              MembersTable(),
            ],
          ),
        ),
      ),
    );
  }
}
