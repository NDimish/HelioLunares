import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventGridView.dart';

class UserHubPage_events extends StatefulWidget {
  UserHubPage_events({super.key});

  @override
  State<UserHubPage_events> createState() => _UserHubPage_eventsState();
}

class _UserHubPage_eventsState extends State<UserHubPage_events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      // MainAppBar(),
      body: Center(
        child: Container(
          color: const Color(0xFFF4E7FA),
          child: EventsGridView(context),
        ),
      ),
      drawer: SideAppBar(context),
    );
  }
}
