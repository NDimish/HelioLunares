import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _settingsList(BuildContext context) {
  //Build a hashmap to allow setting title AND description.
  final Map<String, String> test = {
    "Account": "Modify your account details.",
    "Password": "Change your password.",
    "Manage notifications": "Opt in/out to certain notifications.",
    "Give feedback": "Tell us how to improve your experience!",
    "UI Customisation": "Add some unique flair!",
  };
  final keys = test.keys.toList();
  return ListView.separated(
    itemCount: test.length,
    separatorBuilder: (context, index) {
      return const Divider();
    },
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return MouseRegion(
          cursor: SystemMouseCursors.copy,
          child: Card(
            child: ListTile(
              leading: const Icon(
                CupertinoIcons.settings,
                size: 26.0,
                semanticLabel: "test",
              ),
              title: Text(keys[index]),
              subtitle: Text("${test[keys[index]]}"),
              onTap: () => print("user clicked on ${keys[index]}"),
            ),
          ));
    },
  );
}
