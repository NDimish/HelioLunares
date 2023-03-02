import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      TableRow(children: [
        Container(
          height: 25,
          alignment: Alignment.center,
          child: Text("First Name"),
        ),
        Container(
          height: 25,
          alignment: Alignment.center,
          child: Text("Last Name"),
        ),
        Container(
          height: 25,
          alignment: Alignment.center,
          child: Text("Email"),
        ),
        Container(
          height: 25,
          alignment: Alignment.center,
          child: Text("Join Date"),
        ),
        Container(
          height: 25,
          alignment: Alignment.center,
          child: Text("Student"),
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: _setData(),
    );
  }
}
