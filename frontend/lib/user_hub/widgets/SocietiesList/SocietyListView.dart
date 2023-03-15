import 'package:flutter/material.dart';
import 'SocietyListTile.dart';

class SocietyListView extends ListView {
  SocietyListView(BuildContext context, {super.key})
      : super(
            padding: const EdgeInsets.all(20),
            children: [
              SocietyListTile(context, "Soc 1", "A very long text. A very long text. A very long text. A very long text. A very long text.", "KCL"),
              SocietyListTile(context, "Soc 2", "Hi hello", "Imperial"),
              SocietyListTile(context, "Soc 3", "Hi hello", "Oxford"),
            ]);
}
