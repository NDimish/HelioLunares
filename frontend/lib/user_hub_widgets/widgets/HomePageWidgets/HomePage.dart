import 'package:flutter/material.dart';
import 'package:university_ticketing_system/user_hub_widgets/widgets/MainAppBar.dart';
import 'package:university_ticketing_system/user_hub_widgets/widgets/SideAppBarWidgets/SideAppBar.dart';
import 'package:university_ticketing_system/user_hub_widgets/widgets/EventsGrid/EventGridView.dart';

class HomePage extends StatefulWidget{
  HomePage({
    super.key
  }
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        // MainAppBar(),
        body:Center(
            child: Container(
              color: Color(0xFF161A1D),
              child: EventsGridView(),
            ),
          ),
        drawer: SideAppBar(context),

      );
  }
}