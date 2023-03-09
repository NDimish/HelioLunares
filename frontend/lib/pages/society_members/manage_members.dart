import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

class ManageMembers extends StatefulWidget {
  const ManageMembers({super.key});

  @override
  State<ManageMembers> createState() => _ManageMembersState();
}

class _ManageMembersState extends State<ManageMembers> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => data.dataCollector<data.User>(),
        builder: (context, child) {
          final allUserData =
              Provider.of<data.dataCollector<data.User>>(context);
          return Column(
            children: const [
              SizedBox(height: 40),
              Text("Inner Circle"),
              MembersTable(),
              SizedBox(
                height: 20,
              ),
              Text("Committee"),
              MembersTable(),
              SizedBox(
                height: 20,
              ),
              Text("Members"),
              MembersTable(),
            ],
          );
        });
  }
}
