import 'package:flutter/material.dart';

class MainAppBar extends AppBar{
  MainAppBar():super(
    title: Text("Tickets for Two"),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE5383B),
            Color(0xFFA4161A)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          ),
          
      )
    ),
    // 
  );
}