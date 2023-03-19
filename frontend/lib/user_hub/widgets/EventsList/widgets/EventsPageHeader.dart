import 'package:flutter/material.dart';

class EventsPageHeader extends StatelessWidget {
  final String headerName;
  final Icon headerIcon;
  const EventsPageHeader(
      {required this.headerName, required this.headerIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        headerIcon,
        const SizedBox(width: 5.0),
        Text(
          headerName,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Arvo"),
        ),
      ],
    );
  }
}
