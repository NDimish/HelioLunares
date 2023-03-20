import 'package:flutter/material.dart';
import 'package:university_ticketing_system/pages/society_hub/society_hub.dart';
import 'package:university_ticketing_system/widgets/layout.dart';

/*
This widget is a button that links to the Society Hub (Sita).
It checks if the user has the relevant permissions:
PeopleRoleAtSociety = 2, or 
PeopleRoleAtSociety = 3

otherwise hide this widget
*/

class SocietyHubLink extends StatelessWidget {
  SocietyHubLink({super.key});

  var x = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(child:IconButton(
      icon: Icon(Icons.swap_horiz_outlined),
      tooltip: "Swap to Society Hub",
      onPressed: () {
        Navigator.push(context, 
          MaterialPageRoute(
                  builder: (context) => SiteLayout())
        );
      },
      
    ),
    visible: x,
    );
  }
}