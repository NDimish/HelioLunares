import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsGrid/EventGridView.dart';

class UserHubPage extends StatefulWidget{
  UserHubPage({
    super.key
  }
  );

  @override
  State<UserHubPage> createState() => _UserHubPageState();
}

class _UserHubPageState extends State<UserHubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context),
        // MainAppBar(),
        body:Center(
            child: Container(
              color: Color(0xFFF4E7FA),
              child: EventsGridView(),
            ),
          ),
        drawer: SideAppBar(context),

      );
  }
}