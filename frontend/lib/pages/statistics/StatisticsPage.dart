import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'
    as Ticks;

import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/backend_communication/models/Event.dart';
import 'package:university_ticketing_system/backend_communication/models/SocietyRole.dart';

import 'package:university_ticketing_system/globals.dart' as globals;
import 'package:university_ticketing_system/pages/statistics/listOfTickets.dart';

class Statistics extends StatefulWidget {
  final int societyId;
  const Statistics({required this.societyId, super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  void callback() {
    setState(() {});
  }

  final TextEditingController _textFieldController = TextEditingController();
  String? codeDialog;
  String? valueText;

  Future<void> _updateAttendance(int eventId) async {
    print("This is updating attendance.");
    // Event=${widget.societyId}
    final response = await http.put(
        Uri.parse("${globals.DATASOURCE}event/${eventId}/"),
        headers: (globals.localdataobj.getToken() != "")
            ? {
                HttpHeaders.authorizationHeader:
                    "token ${globals.localdataobj.getToken()}"
              }
            : {},
        body: {'attendance': codeDialog});
    if (response.statusCode == 201) {
      // print(response.body);
      List data;
      try {
        data = json.decode(response.body) as List;
      } catch (e) {
        data = json.decode("[" + response.body + "]") as List;
      }
      return Future.delayed(const Duration(microseconds: 0),
          () => {data.map<Event>((json) => (Event.fromJson(json))).toList()});
    }
    print("Finished updating");
  }

  Future<void> _displayTextInputDialog(
      BuildContext context, int eventId) async {
    //This function have been researched/reused from:
    // https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Attendace'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Enter attendance here..."),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  codeDialog = valueText;
                  _updateAttendance(eventId);
                  Navigator.pop(context);
                  callback();
                },
              ),
            ],
          );
        });
  }

  Future<Set<List<Event>>> _fetchEventData() async {
    print("This is loading event data.");
    // Event=${widget.societyId}
    final response = await http.get(
        Uri.parse("${globals.DATASOURCE}event/?society_id=${widget.societyId}"),
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
      return Future.delayed(const Duration(microseconds: 0),
          () => {data.map<Event>((json) => (Event.fromJson(json))).toList()});
    }
    print("failed");
    return {};
  }

  Future<Set<List<Ticks.Tickets>>> _fetchTicketData() async {
    print("This is loading ticket data.");
    // Event=${widget.societyId}
    final response = await http.get(Uri.parse("${globals.DATASOURCE}ticket/"),
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
                    .map<Ticks.Tickets>(
                        (json) => (Ticks.Tickets.fromJson(json)))
                    .toList()
              });
    }
    print("failed");
    return {};
  }

  Future<Set<List<SocietyRole>>> _fetchSocietyRoleData() async {
    print("This is loading society role data.");
    // Event=${widget.societyId}
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

  Table _allEvents(List<data.Event> items) {
    List<TableRow> allEvents = [];

    allEvents.add(const TableRow(
      children: [
        Center(
            child: Text(
          "Event ID",
          style: TextStyle(fontSize: 20),
        )),
        Center(
            child: Text(
          "Event Name",
          style: TextStyle(fontSize: 20),
        )),
        Center(
            child: Text(
          "No of Tickets",
          style: TextStyle(fontSize: 20),
        )),
        Center(
            child: Text(
          "Price",
          style: TextStyle(fontSize: 20),
        )),
        Center(
            child: Text(
          "Attendance",
          style: TextStyle(fontSize: 20),
        )),
        Center(
          child: Text(
            "Actions",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ));

    for (var i = 0; i < items.length; i++) {
      allEvents.add(TableRow(children: [
        Center(child: Text(items[i].id.toString())),
        Center(child: Text(items[i].title)),
        Center(child: NoOfTicketsText(eventIdFromData: items[i].id)),
        Center(child: Text("£${items[i].price.toString()}")),
        Center(child: Text(items[i].attendance.toString())),
        Center(
          child: DropdownButton(
            hint: const Text('Perform:'),
            underline: const SizedBox(width: 0, height: 0),
            items: const [
              DropdownMenuItem(
                value: "addattendance",
                child: Text("Add Attendance"),
              ),
              DropdownMenuItem(
                value: "getlistticket",
                child: Text("Get List of tickets"),
              ),
            ],
            onChanged: ((value) => {
                  if (value == "addattendance")
                    {_displayTextInputDialog(context, items[i].id)}
                  else if (value == "getlistticket")
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListOfTickets(eventID: items[i].id)))
                    },
                }),
          ),
        )
      ]));
    }

    return Table(
      border: const TableBorder(
          top: BorderSide(width: 2, color: Color(0xFF703c6c)),
          bottom: BorderSide(width: 2, color: Color(0xFF703c6c)),
          right: BorderSide(width: 2, color: Color(0xFF703c6c)),
          left: BorderSide(width: 2, color: Color(0xFF703c6c)),
          horizontalInside: BorderSide(width: .5, color: Color(0xFF703c6c))),
      children: allEvents,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchEventData(),
        builder:
            (BuildContext context, AsyncSnapshot<Set<List<Event>>> snapshot) {
          if (snapshot.hasData) {
            // return _allEvents(snapshot.requireData.first, []);
            return ListView(
              children: [
                //This is the top information
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      color: MyColours.navbarColour,
                      child: Column(
                        children: [
                          FutureBuilder(
                              future: _fetchSocietyRoleData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Set<List<SocietyRole>>>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      "Number of members: ${snapshot.requireData.first.length}");
                                } else {
                                  return const Text("Number of Members:");
                                }
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      color: MyColours.navbarColour,
                      child: Column(
                        children: [
                          FutureBuilder(
                              future: _fetchEventData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Set<List<Event>>> snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      "Number of events: ${snapshot.requireData.first.length}");
                                } else {
                                  return const Text("Number of Events:");
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                //This display the tables for each event
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: _allEvents(snapshot.requireData.first),
                ),
                //This is the graph
                // Expanded(
                //   child: AspectRatio(
                //     aspectRatio: 1.50,
                //     child: Padding(
                //       padding: const EdgeInsets.all(20),
                //       child: LineChart(LineChartData(
                //         gridData: FlGridData(
                //           show: true,
                //           drawVerticalLine: true,
                //           horizontalInterval: 1,
                //           verticalInterval: 1,
                //           getDrawingHorizontalLine: (value) {
                //             return FlLine(
                //               color: Color(0xFFFFFFFF),
                //               strokeWidth: 1,
                //             );
                //           },
                //           getDrawingVerticalLine: (value) {
                //             return FlLine(
                //               color: Color(0xFFFFFFFF),
                //               strokeWidth: 1,
                //             );
                //           },
                //         ),
                //         borderData: FlBorderData(
                //           show: true,
                //           border: Border.all(color: const Color(0xff37434d)),
                //         ),
                //         // minX: 0,
                //         // maxX: 5,
                //         // minY: 0,
                //         // maxY: 5,
                //         lineBarsData: [
                //           LineChartBarData(
                //               spots: _getGraphData(snapshot.requireData.first))
                //         ],
                //       )),
                //     ),
                //   ),
                // )
              ],
            );
          } else {
            return Text("Loading");
          }
        });
  }
}

class NoOfTicketsText extends StatefulWidget {
  final int eventIdFromData;
  const NoOfTicketsText({required this.eventIdFromData, super.key});

  @override
  State<NoOfTicketsText> createState() => _NoOfTicketsTextState();
}

class _NoOfTicketsTextState extends State<NoOfTicketsText> {
  Future<Set<List<Ticks.Tickets>>> _fetchTicketData(int eventId) async {
    print("This is loading ticket data.");
    // Event=${widget.societyId}
    final response = await http.get(
        Uri.parse("${globals.DATASOURCE}ticket/?event=${eventId}"),
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
                    .map<Ticks.Tickets>(
                        (json) => (Ticks.Tickets.fromJson(json)))
                    .toList()
              });
    }
    print("failed");
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchTicketData(widget.eventIdFromData),
        builder: (BuildContext context,
            AsyncSnapshot<Set<List<Ticks.Tickets>>> ticketSnapshot) {
          if (ticketSnapshot.hasData) {
            return Text("${ticketSnapshot.requireData.first.length}");
          } else {
            return Text("N/A");
          }
        });
  }
}
