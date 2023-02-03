import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/user_settings/widgets/settings_list.dart';
import 'package:university_ticketing_system/screens/user_settings/widgets/settings_sidebar.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("settings skeleton"),
      ),
      body: const SettingsSideBar(),
    );
  }
}
