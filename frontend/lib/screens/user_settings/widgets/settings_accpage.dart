import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/user_settings/widgets/settings_nameForm.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Column(children: [
     NameForm(),


    ]));
  }
}
