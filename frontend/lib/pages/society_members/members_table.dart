import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as dataCol;

import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/backend_communication/models/all.dart';
import 'package:university_ticketing_system/backend_communication/societyfunctions.dart';

class MembersTable extends StatefulWidget {
  final int role;
  final int societyId;
  final int user_society_role_level; // this is the user's role in society
  final int
      user_level; // this is user level, 1/2 for non/student and 3 for society account
  final List dataset;
  final Function statify;

  const MembersTable(this.role, this.user_society_role_level, this.user_level,
      this.societyId, this.dataset, this.statify,
      {super.key});

  @override
  State<MembersTable> createState() => _MembersTableState();
}

class _MembersTableState extends State<MembersTable> {
  List<DropdownMenuItem> _actionsForRole() {
    if (widget.user_level == 3) {
      if (widget.role == 3) {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "Demote", child: Text("Demote")),
        ];
      } else if (widget.role == 2) {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "Promote", child: Text("Promote")),
          DropdownMenuItem(value: "Demote", child: Text("Demote")),
        ];
      } else {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "Promote", child: Text("Promote")),
        ];
      }
    } else {
      //This is if it is not a society account so we need to see if they are in soc
      if (widget.user_society_role_level == 3) {
        if (widget.role == 3) {
          return const [];
        } else if (widget.role == 2) {
          return const [
            DropdownMenuItem(value: "Remove", child: Text("Remove")),
            DropdownMenuItem(value: "Demote", child: Text("Demote")),
          ];
        } else {
          return const [
            DropdownMenuItem(value: "Remove", child: Text("Remove")),
            DropdownMenuItem(value: "Promote", child: Text("Promote")),
          ];
        }
      } else if (widget.user_society_role_level == 2) {
        if (widget.role == 3) {
          return const [];
        } else if (widget.role == 2) {
          return const [];
        } else {
          return const [
            DropdownMenuItem(value: "Remove", child: Text("Remove")),
          ];
        }
      }
    }
    return const [];
  }

  List<TableRow> _setData() {
    List<TableRow> dataArr = [
      TableRow(
          decoration: const BoxDecoration(
              color: Color(0xFFF4E7FA),
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFF703c6c)))),
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFF703c6c))),
              ),
              height: 25,
              alignment: Alignment.center,
              child: const Text("ID"),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFF703c6c))),
              ),
              height: 25,
              alignment: Alignment.center,
              child: const Text("First Name"),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFF703c6c))),
              ),
              height: 25,
              alignment: Alignment.center,
              child: const Text("Last Name"),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFF703c6c))),
              ),
              height: 25,
              alignment: Alignment.center,
              child: const Text("Email"),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFF703c6c))),
              ),
              height: 25,
              alignment: Alignment.center,
              child: const Text("Student"),
            ),
            Container(
              height: 25,
              alignment: Alignment.center,
              child: const Text("Actions"),
            ),
          ]),
    ];

    //Simple way to add data to the tables
    for (var i = 0; i < widget.dataset.length; i++) {
      if (widget.dataset[i].role == widget.role) {
        dataArr.add(_createDataRow({
          "id": widget.dataset[i].people.user.id.toString(),
          "first_name": widget.dataset[i].people.first_name,
          "last_name": widget.dataset[i].people.last_name,
          "email": widget.dataset[i].people.user.email,
          "student":
              (widget.dataset[i].people.user.userType == 2) ? 'True' : 'False',
        }));
      }
    }

    return dataArr;
  }

  TableRow _createDataRow(Map dataset) {
    return TableRow(children: [
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["id"]),
      ),
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["first_name"]),
      ),
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["last_name"]),
      ),
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["email"]),
      ),
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["student"]),
      ),
      Container(
          key: Key("userid-${dataset['id']}"),
          height: 25,
          alignment: Alignment.center,
          child: DropdownButton(
              hint: const Text("Perform"),
              underline: const SizedBox(width: 0, height: 0),
              items: _actionsForRole(),
              onChanged: (value) => {
                    if (value == "Remove")
                      {
                        removeFromSociety(
                            int.parse(dataset['id']), widget.societyId)
                      }
                    else if (value == "Promote")
                      {updateSociety(int.parse(dataset['id']), widget.role + 1)}
                    else if (value == "Demote")
                      {
                        updateSociety(
                            int.parse(dataset['id']), widget.role - 1),
                      },
                    this.widget.statify(2)
                  })),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: const TableBorder(
          top: BorderSide(width: 2, color: Color(0xFF703c6c)),
          bottom: BorderSide(width: 2, color: Color(0xFF703c6c)),
          right: BorderSide(width: 2, color: Color(0xFF703c6c)),
          left: BorderSide(width: 2, color: Color(0xFF703c6c)),
          horizontalInside: BorderSide(width: .5, color: Color(0xFF703c6c))),
      children: _setData(),
    );
  }
}
