import 'package:flutter/material.dart';
import 'SocietyListTile.dart';

class SocietyListView extends ListView {
  SocietyListView(BuildContext context, {super.key})
      : super(
            padding: const EdgeInsets.all(20),
            children: [
              SocietyListTile(societyName: "Soc 1", summary:"A very long text. A very long text. A very long text. A very long text. A very long text.", uni: "KCL"),
              SocietyListTile(societyName: "Soc 2",summary: "Hi hello", uni:"Imperial"),
              SocietyListTile(societyName: "Soc yummy",summary: "Hi hello", uni:"Oxford"),
              SocietyListTile(societyName: "The High Table",summary: "", uni:"---"),
            ]);
}
