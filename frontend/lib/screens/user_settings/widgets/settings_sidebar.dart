import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSideBar extends StatefulWidget {
  const SettingsSideBar({super.key});

  @override
  State<SettingsSideBar> createState() => _SettingsSideBarState();
}

class _SettingsSideBarState extends State<SettingsSideBar> {
  int _selectedIndex = 0;
  double groupAlignment = -1.0;

  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        NavigationRail(
          elevation: 10,
          minWidth: 120,
          groupAlignment: -1,
          labelType: NavigationRailLabelType.all,
          selectedLabelTextStyle: TextStyle(
              color: Colors.red[500],
              decoration: TextDecoration.underline,
              fontSize: 16),
          unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
          leading: Column(children: const [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Icon(
              Icons.settings,
              size: 30,
            )),
            SizedBox(
              height: 2,
            ),
            Text(
              "Settings",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
                icon: Icon(Icons.account_circle_outlined),
                selectedIcon: Icon(Icons.account_circle),
                label: Text("Account")),
            NavigationRailDestination(
                icon: Icon(Icons.password_outlined),
                selectedIcon: Icon(Icons.password),
                label: Text("Password")),
            NavigationRailDestination(
                icon: Icon(Icons.brush_outlined),
                selectedIcon: Icon(Icons.brush),
                label: Text("Appearance")),
            NavigationRailDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: Text("Notifications")),
            NavigationRailDestination(
                icon: Icon(Icons.computer_outlined),
                selectedIcon: Icon(Icons.computer),
                label: Text("Connections")),
            NavigationRailDestination(
                icon: Icon(Icons.poll_outlined),
                selectedIcon: Icon(Icons.poll),
                label: Text("Feedback")),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: changeDestination,
        ),
        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),
        //Main subpage content goes in here.
        Center(
          child: Text(
            "hi - Travelling to subpage $_selectedIndex",
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}
