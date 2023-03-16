import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListView.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/AppBarWidgets/userSettingsPage/user_settings.dart';
import 'package:university_ticketing_system/user_hub/widgets/SearchBarWidgets/CustomSearchBar_Events.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubThemes.dart';

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
      appBar: AppBar(
        title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TickeX"), SizedBox(width: 30),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: SizedBox(
                    child: TextField(
                      cursorColor: Color(0xff70587C),
                      cursorHeight: 20,
                      controller: search_controller,


                      //--------------------
                      // MAIN SEARCH FUNCTION HERE
                      //--------------------
                      onChanged: (value) {
                        setSearchText(value);

                        setState(() {
                          
                        });
                      },

                      // Decoration for TextField
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                        hintText:"Search...",


                        // Clears search bar
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close, color: Color(0xff70587C),),
                          onPressed: () {
                            search_controller.clear();
                            setSearchText("");
                            setState(() {
                              
                            });
                          },
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        )
                        ),
                      ),
                    )     
                ,width: 500,
                height: 45,
                ),
              ]),
            ),

            backgroundColor: const Color(0xff70587C),
            iconTheme: MainAppBarTheme(),
            titleTextStyle: MainAppBarTextTheme(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UserBoughtTicketScreen()));
                  },
                  icon: const Icon(Icons.receipt)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSettingsPage()));
                  },
                  icon: const Icon(Icons.settings))
            ]
      ),
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
