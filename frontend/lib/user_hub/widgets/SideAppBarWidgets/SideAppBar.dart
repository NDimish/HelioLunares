import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarList.dart';

class SideAppBar extends Drawer{
  SideAppBar(BuildContext context):super(
    child: SideAppBarList(context),
  );
}