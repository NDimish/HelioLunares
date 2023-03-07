import 'package:flutter/material.dart';

class SideAppBarListTile extends ListTile{
  SideAppBarListTile(String optionName, IconData iconname, Function func):super(
    leading: Icon(iconname),
    title: Text(optionName),
    //TODO: get this to work
    onTap: () => func,
  );
  
}
