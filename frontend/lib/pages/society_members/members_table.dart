import 'package:flutter/material.dart';

class MembersTable extends StatefulWidget {
  final int role;
  final int user_society_role_level = 2; // this is the user's role in society
  final int user_level =
      1; // this is user level, 1/2 for non/student and 3 for society account

  const MembersTable(this.role, {super.key});

  @override
  State<MembersTable> createState() => _MembersTableState();
}

class _MembersTableState extends State<MembersTable> {
  List<List<String>> data = [
    ["John", "Doe", "johndoe@example.com", "12-02-2022", "yes"]
  ];

  List<DropdownMenuItem> _actionsForRole() {
    if (widget.user_level == 3) {
      if (widget.role == 3) {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "demote", child: Text("Demote")),
        ];
      } else if (widget.role == 2) {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "Promote", child: Text("Promote")),
          DropdownMenuItem(value: "demote", child: Text("Demote")),
        ];
      } else {
        return const [
          DropdownMenuItem(value: "Remove", child: Text("Remove")),
          DropdownMenuItem(value: "promote", child: Text("Promote")),
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
            DropdownMenuItem(value: "demote", child: Text("Demote")),
          ];
        } else {
          return const [
            DropdownMenuItem(value: "Remove", child: Text("Remove")),
            DropdownMenuItem(value: "promote", child: Text("Promote")),
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
              child: const Text("Join Date"),
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
    dataArr.add(_createDataRow({
      "first_name": 'John',
      "last_name": 'Doe',
      "email": 'johndoe@example.org',
      "join_date": '12-01-2022',
      "student": 'true',
    }));
    dataArr.add(_createDataRow({
      "first_name": 'John',
      "last_name": 'Doe',
      "email": 'johndoe@example.org',
      "join_date": '12-01-2022',
      "student": 'true',
    }));
    dataArr.add(_createDataRow({
      "first_name": 'John',
      "last_name": 'Doe',
      "email": 'johndoe@example.org',
      "join_date": '12-01-2022',
      "student": 'true',
    }));

    return dataArr;
  }

  TableRow _createDataRow(Map dataset) {
    return TableRow(children: [
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
        child: Text(dataset["join_date"]),
      ),
      Container(
        height: 25,
        alignment: Alignment.center,
        child: Text(dataset["student"]),
      ),
      Container(
          height: 25,
          alignment: Alignment.center,
          child: DropdownButton(
              hint: const Text("Perform"),
              underline: const SizedBox(width: 0, height: 0),
              items: _actionsForRole(),
              onChanged: ((value) => {}))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
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
