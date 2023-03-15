import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListView.dart';

class UserHubPage_societies extends StatefulWidget {
  UserHubPage_societies({super.key});

  @override
  State<UserHubPage_societies> createState() => _UserHubPage_societiesState();
}

class _UserHubPage_societiesState extends State<UserHubPage_societies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      // MainAppBar(),
      body: Center(
        child: Container(
          color: const Color(0xFFF4E7FA),
          child: SocietyListView(context),
        ),
      ),
      drawer: SideAppBar(context),
    );
  }
}
