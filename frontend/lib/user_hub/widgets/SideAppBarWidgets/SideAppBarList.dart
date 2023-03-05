import 'package:flutter/material.dart';
import 'SideAppBarListTile.dart';
import 'SideAppBarFunctions.dart';
import 'SideAppBarListWidgetTile.dart';

class SideAppBarList extends ListView{
  SideAppBarList(BuildContext context):super(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(child: Text("Tickets For Two")),

      SideAppBarListTile("Show events", Icons.search, sayHello),
      SideAppBarListTile("Show societies", Icons.access_time_filled_rounded,emptyFunc),
    ]
  );
}