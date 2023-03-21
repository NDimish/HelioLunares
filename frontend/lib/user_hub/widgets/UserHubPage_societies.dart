import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListView.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubTheme.dart';

import 'AppBarWidgets/bought_tickets/user_bought_ticket_screen.dart';

class UserHubPage_societies extends StatefulWidget {
  UserHubPage_societies({super.key});

  @override
  State<UserHubPage_societies> createState() => _UserHubPage_societiesState();
}

var search_controller = TextEditingController();

class _UserHubPage_societiesState extends State<UserHubPage_societies> {
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
          child: SocietyListView(),
        ),
      ),
      drawer: SideAppBar(),
    );
  }
}
