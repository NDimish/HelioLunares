import 'package:flutter/material.dart';
import 'SideAppBarListTile.dart';
import 'SideAppBarFunctions.dart';
import 'SideAppBarListWidgetTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/UserHubPage.dart';

class SideAppBarList extends ListView{
  SideAppBarList(BuildContext context):super(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(child: Text("Tickets For Two")),

      // Temporary solution until i figure out how to get functions working
      ListTile(leading:Icon(Icons.calendar_month),title: Text("Show events"), onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => UserHubPage()));
      },),

      ListTile(leading:Icon(Icons.group),title: Text("Show societies"), onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page showing societies here")),)));
      },)

      
      // SideAppBarListTile("Show events", Icons.calendar_month, (){
      //   Navigator.push(
      //     context, 
      //     MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));}),

      // SideAppBarListTile("Show societies", Icons.group,(){
      //   Navigator.push(
      //     context, 
      //     MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for profile here (???)")),)));
      // }),
    ]
  );
}