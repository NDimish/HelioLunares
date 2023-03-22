import 'package:flutter/material.dart';

class MembersTable extends StatefulWidget {
  const MembersTable({super.key});

  @override
  State<MembersTable> createState() => _MembersTableState();
}

class _MembersTableState extends State<MembersTable> {
  List<List<String>> data = [
    ["John", "Doe", "johndoe@example.com", "12-02-2022", "yes"]
  ];

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
              items: const [
                DropdownMenuItem(value: "block", child: Text("Block")),
                DropdownMenuItem(value: "promote", child: Text("Promote")),
                DropdownMenuItem(value: "demote", child: Text("Demote")),
              ],
              onChanged: ((value) => {}))),
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
