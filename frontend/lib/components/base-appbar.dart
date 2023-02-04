import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.white;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;
  // final Widget leading;
  final IconThemeData iconTheme = const IconThemeData(color: Colors.black);

  const BaseAppBar(
      {Key? key,
      required this.title,
      // required this.leading,
      required this.widgets,
      required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: widgets,
      iconTheme: iconTheme,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
