import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListView.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubTheme.dart';

import 'AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';

class UserHubPage_events extends StatefulWidget {
  UserHubPage_events({super.key});

  @override
  State<UserHubPage_events> createState() => _UserHubPage_eventsState();
}

var search_controller = TextEditingController();

class _UserHubPage_eventsState extends State<UserHubPage_events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context, 
      // Function that updates list of events
      (value){
        setSearchText(value);
        print("in search func");
        setState(() {
          
        });
      },
      // Function for clearing the search bar
      (){
        search_controller.clear();
        setSearchText("");
        setState(() {
          
        });
      }, // Controller for text field in CustomSearchBar_Events
      search_controller
      ),

      body: Center(
        child: Container(
          color: const Color(0xFFF4E7FA),
          child: EventListView(),
        ),
      ),
      drawer: SideAppBar(context),
    );
  }
}
