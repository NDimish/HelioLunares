import 'package:flutter/material.dart';

class SideAppBarListTile extends StatelessWidget {
  SideAppBarListTile({super.key,
    required this.optionName,
    required this.iconname,
    required this.input
  });

  String optionName;
  IconData iconname;
  Widget input;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconname),
          title: Text(optionName),
          
          onTap: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => input));
          },
    );
  }
}

