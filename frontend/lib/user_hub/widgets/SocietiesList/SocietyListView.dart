import 'package:flutter/material.dart';
import 'SocietyListTile.dart';

class SocietyListView extends GridView{
  SocietyListView(BuildContext context):super(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 30,
      mainAxisSpacing: 30),
    padding: EdgeInsets.all(20),
    
    children: [
      SocietyListTile(context, "Test event", DateTime.now(), "Wesley"),
      SocietyListTile(context,"Test event", DateTime.now(), "Wesley"),
      SocietyListTile(context,"Test event", DateTime.now(), "Wesley"),
    ]
  );

}