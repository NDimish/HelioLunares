import 'package:flutter/material.dart';
import 'SideAppBarListTile.dart';
import 'SideAppBarFunctions.dart';
import 'SideAppBarListWidgetTile.dart';

class SideAppBarList extends ListView{
  SideAppBarList(BuildContext context):super(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(child: Text("Tickets For Two")),

      // Ugly hack until i figure out how to get functions working
      SideAppBarListTile("Show events", Icons.calendar_month, (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));}),

      SideAppBarListTile("Show societies", Icons.group,(){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));
      }),
    ]
  );
}