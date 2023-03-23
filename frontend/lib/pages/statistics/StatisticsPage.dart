import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'
    as Ticks;

import 'package:http/http.dart' as http;
import 'package:university_ticketing_system/backend_communication/models/Event.dart';

import 'package:university_ticketing_system/globals.dart' as globals;

class Statistics extends StatefulWidget {
  final int societyId;
  const Statistics({required this.societyId, super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Future<Set<List<Event>>> _fetchEventData() async {
    print("This is loading data.");
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

  Future<Set<List<Ticks.Tickets>>> _fetchTicketData(int eventId) async {
    print("This is loading data.");
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

  Table _allEvents(List<data.Event> items, List<Ticks.Tickets> tickets) {
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
      int noTickets = 0;
      // for (var j = 0; j < tickets.length; j++) {
      //   if (tickets[j].event.id == items[i].id) {
      //     noTickets++;
      //   }
      // }
      allEvents.add(TableRow(children: [
        Center(child: Text(items[i].id.toString())),
        Center(child: Text(items[i].title)),
        Center(child: Text("N/A")),
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
            onChanged: ((value) => {}),
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                  filter: {'society_id': widget.societyId.toString()},
                  order: data.OrderType.CHRONOLOGICAL)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.SocietyRole>(
                  filter: {'society': widget.societyId.toString()},
                  order: data.OrderType.CHRONOLOGICAL)),
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<Ticks.Tickets>(
                  filter: {}, order: data.OrderType.CHRONOLOGICAL))
        ],
        builder: (context, child) {
          final eventData =
              Provider.of<data.dataCollector<data.Event>>(context);
          final membersData =
              Provider.of<data.dataCollector<data.SocietyRole>>(context);
          final ticketsData =
              Provider.of<data.dataCollector<Ticks.Tickets>>(context);

          return ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    color: MyColours.navbarColour,
                    child: Column(
                      children: [
                        const Text("Number of Members:"),
                        Text(membersData.collection.length.toString())
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
                        const Text("Number of Events:"),
                        Text(eventData.collection.length.toString())
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: FutureBuilder(
                      future: _fetchEventData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Set<List<Event>>> snapshot) {
                        if (snapshot.hasData) {
                          return _allEvents(snapshot.requireData.first, []);
                        } else {
                          return Text("Loading");
                        }
                      })),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.50,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: LineChart(LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Color(0xFFFFFFFF),
                            strokeWidth: 1,
                          );
                        },
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: Color(0xFFFFFFFF),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d)),
                      ),
                      minX: 0,
                      maxX: 5,
                      minY: 0,
                      maxY: 5,
                      lineBarsData: [
                        LineChartBarData(spots: const [
                          FlSpot(0, 0),
                          FlSpot(1, 2),
                          FlSpot(2, 5),
                          FlSpot(3, 3),
                          FlSpot(4, 4),
                          FlSpot(5, 3),
                        ])
                      ],
                    )),
                  ),
                ),
              )
            ],
          );
        });
  }
}
