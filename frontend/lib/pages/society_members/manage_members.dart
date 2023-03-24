import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/pages/society_members/members_table.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/backend_communication/models/societyRole.dart';

import 'package:university_ticketing_system/globals.dart' as globals;

class ManageMembers extends StatefulWidget {
  final int societyId;
  const ManageMembers({required this.societyId, super.key});

  @override
  State<ManageMembers> createState() => _ManageMembersState();
}

class _ManageMembersState extends State<ManageMembers> {
  Set<List> roleData = {};
  void callback() {
    setState(() {});
  }

  // this is the user's role in society // this is user level, 1/2 for non/student and 3 for society account
  Future<Set<List<data.SocietyRole>>> _fetchRoleData() async {
    print("This is loading data.");
    final response = await http.get(
        Uri.parse(
            "${globals.DATASOURCE}societyrole/?society=${widget.societyId}"),
        headers: (globals.localdataobj.getToken() != "")
            ? {
                HttpHeaders.authorizationHeader:
                    "token ${globals.localdataobj.getToken()}"
              }
            : {});
    if (response.statusCode == 200) {
      // print(response.body);
      List data;
      try {
        data = json.decode(response.body) as List;
      } catch (e) {
        data = json.decode("[" + response.body + "]") as List;
      }
      return Future.delayed(
          const Duration(microseconds: 0),
          () => {
                data
                    .map<SocietyRole>((json) => (SocietyRole.fromJson(json)))
                    .toList()
              });
    }
    print("failed");
    return {};
  }

  @override
  Widget build(BuildContext context) {
    //They have enough power to be in this society management
    // print(_fetchRoleData().then((value) => print(value)));
    return FutureBuilder(
        future: _fetchRoleData(),
        builder: (BuildContext context,
            AsyncSnapshot<Set<List<data.SocietyRole>>> snapshot) {
          if (snapshot.hasData) {
            int userSocietyRoleLevel = 0;
            //now check user role level first
            if (globals.localdataobj.getUserLevel() != 3) {
              //check in the array if they are in soc and have power
              for (var i = 0; i < snapshot.requireData.first.length; i++) {
                if (snapshot.requireData.first[i].people.user.id ==
                    globals.localdataobj.getUserID()) {
                  userSocietyRoleLevel = snapshot.requireData.first[i].role;
                  break;
                }
              }
              if (userSocietyRoleLevel == 1) {
                return const Text("You do not have power in society.");
              }
              if (userSocietyRoleLevel == 0) {
                return const Text("You are not part of this society.");
              }
            }
            // return Text(snapshot.requireData.first.toString());
            return ListView(
              children: [
                const SizedBox(height: 40),
                const Text("Admins"),
                MembersTable(
                    3,
                    userSocietyRoleLevel,
                    globals.localdataobj.getUserLevel(),
                    widget.societyId,
                    snapshot.requireData.first,
                    callback),
                const SizedBox(
                  height: 20,
                ),
                const Text("Local Admins"),
                MembersTable(
                    2,
                    userSocietyRoleLevel,
                    globals.localdataobj.getUserLevel(),
                    widget.societyId,
                    snapshot.requireData.first,
                    callback),
                const SizedBox(
                  height: 20,
                ),
                const Text("Members"),
                MembersTable(
                  1,
                  userSocietyRoleLevel,
                  globals.localdataobj.getUserLevel(),
                  widget.societyId,
                  snapshot.requireData.first,
                  callback,
                ),
              ],
            );
          } else {
            return Text("Loading");
          }
        });
  }
}
