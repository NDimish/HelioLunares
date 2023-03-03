import 'package:flutter/material.dart';
import 'SideAppBarListTile.dart';
import 'SideAppBarFunctions.dart';
import 'SideAppBarListWidgetTile.dart';

class SideAppBarList extends ListView{
  SideAppBarList(BuildContext context):super(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(child: Text("Tickets For Two")),

      SideAppBarListTile("[[ SEARCH BAR ]]", Icons.search, sayHello),
      SideAppBarListTile("Search With Tags", Icons.access_time_filled_rounded,emptyFunc),
      SideAppBarListTile("My Registered Events", Icons.access_time_filled_rounded,emptyFunc),
      SideAppBarListTile("Show Events For My Societies", Icons.access_time_filled_rounded,emptyFunc)
    ]
  );
}