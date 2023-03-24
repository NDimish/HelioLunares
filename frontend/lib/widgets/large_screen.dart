import 'package:flutter/material.dart';
import 'package:university_ticketing_system/widgets/side_menu.dart';
import '../helpers/local_navigator.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator(),
            ))
      ],
    );
  }
}
