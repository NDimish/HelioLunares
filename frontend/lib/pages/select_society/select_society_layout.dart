import 'package:flutter/material.dart';
import 'package:university_ticketing_system/gradient_animation.dart';
import 'package:university_ticketing_system/helpers/responsiveness.dart';
import 'package:university_ticketing_system/pages/select_society/society_list_maker.dart';
import 'package:university_ticketing_system/widgets/large_screen.dart';
import 'package:university_ticketing_system/widgets/side_menu.dart';
import 'package:university_ticketing_system/widgets/top_nav_bar.dart';

class SelectSocietyPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SelectSocietyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: topNavBar(context, scaffoldKey),
        body: CustomLinearGradient(child: SocietyListMaker()));
  }
}
