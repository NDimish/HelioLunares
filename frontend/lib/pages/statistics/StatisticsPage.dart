import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/backend_communication/dataCollector.dart'
    as data;

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final List<int> eventModelData = [5, 2, 1];

  Table _allEvents(List<int> items) {
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
          "Attendance",
          style: TextStyle(fontSize: 20),
        )),
        Center(
            child: Text(
          "Event ID",
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
        Center(child: Text(items[i].toString())),
        Center(child: Text("Event Name")),
        Center(child: Text("No of Tickets")),
        Center(child: Text("Attendance")),
        Center(child: Text("Event ID")),
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
    int eventNo = eventModelData.length;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => data.dataCollector<data.Event>(
                  filter: {}, order: data.OrderType.CHRONOLOGICAL))
        ],
        builder: (context, child) {
          final eventData =
              Provider.of<data.dataCollector<data.Event>>(context);
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
                        Text(eventModelData.length.toString())
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
                child: _allEvents(eventModelData),
              ),
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
