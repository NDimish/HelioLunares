import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/ThemeDataWidgets/UserHubThemes.dart';

class MainAppBar extends AppBar{
  MainAppBar(BuildContext context):super(

    title: Text("TickEX"),
    backgroundColor: Color(0xff70587C),
    iconTheme: MainAppBarTheme(),
    titleTextStyle: MainAppBarTextTheme(),
    actions: [
      IconButton(onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for bought tickets here (Isaac)")),)));
      }, icon: Icon(Icons.receipt)),


      IconButton(onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => Scaffold(body:Center(child:Text("Page for settings here (Shakeeb)")),)));
      }, icon: Icon(Icons.settings))
    ]
    // 
  );
}