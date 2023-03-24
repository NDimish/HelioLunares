import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:university_ticketing_system/backend_communication/models/Ticket.dart'
    as ticks;
import 'package:university_ticketing_system/globals.dart' as globals;
import 'package:http/http.dart' as http;

class ListOfTickets extends StatefulWidget {
  final int eventID;
  const ListOfTickets({required this.eventID, super.key});

  @override
  State<ListOfTickets> createState() => _ListOfTicketsState();
}

class _ListOfTicketsState extends State<ListOfTickets> {
  Future<Set<List<ticks.Tickets>>> _fetchTicketData(int eventId) async {
    print("This is loading ticket data.");
    // Event=${widget.societyId}
    final response = await http.get(
        Uri.parse("${globals.DATASOURCE}ticket/?event=$eventId"),
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
                    .map<ticks.Tickets>(
                        (json) => (ticks.Tickets.fromJson(json)))
                    .toList()
              });
    }
    print("failed");
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(20, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(54, 255, 255, 255),
      ),
      body: FutureBuilder(
        future: _fetchTicketData(widget.eventID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ticks.Tickets> data = snapshot.requireData.first;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      tileColor: const Color.fromARGB(158, 255, 235, 59),
                      leading: const Icon(Icons.text_snippet),
                      title: Column(
                        children: [
                          Text("Ticket ID: ${data[index].id}"),
                          Text("Email: ${data[index].user.email}")
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Text("No tickets Available.");
          }
        },
      ),
    );
  }
}
