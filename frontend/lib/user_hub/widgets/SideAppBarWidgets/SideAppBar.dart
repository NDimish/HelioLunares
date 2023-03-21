import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub/widgets/SideAppBarWidgets/SideAppBarList.dart';

class SideAppBar extends StatelessWidget {
  const SideAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: SideAppBarList(context));
  }
}