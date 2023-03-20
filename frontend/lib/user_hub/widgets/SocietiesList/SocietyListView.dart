import 'package:flutter/material.dart';
import 'SocietyListTile.dart';

// This class will need to take in data from the database
// TODO: allow data to be passed to SocietyListTile for
// dynamic page loading

class SocietyListView extends StatelessWidget {
  SocietyListView({super.key});

  var count = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: count,
      itemBuilder: (context, index){
        return SocietyListTile(
          societyName: "Society $index",
          summary: "Description $index",
          uni: "Uni $index",
        );
      },
    );
  }
}
