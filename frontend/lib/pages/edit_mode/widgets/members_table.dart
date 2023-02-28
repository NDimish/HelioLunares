import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MembersTable extends StatelessWidget {
  const MembersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Text("Name"),
          Text("Name"),
          Text("Name"),
          Text("Name"),
          Text("Name"),
        ])
      ],
    );
  }
}
