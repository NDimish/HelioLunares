import 'package:flutter/material.dart';

// Should have:
// Image
// Name of event
// Date/Time of event
// Organiser

class EventGridTile extends GridTile {
  EventGridTile(
      BuildContext context, String eventName, DateTime dateTime, String org,
      {super.key})
      : super(
            header: Container(
              height: 25,
              decoration: const BoxDecoration(
                color: Color(0xFF70587C),
              ),
              child: const Center(
                  child: Text(
                "EVENT",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 3,
                    color: Colors.white),
              )),
            ),
            child: Material(
              child: Ink(
                height: 1000,
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 195, 172, 223),
                  hoverColor: const Color(0xFFE6D6F9),

                  // TODO
                  // Add links to other pages as an arguments
                  onTap: () {
                    //TEMPLATE FOR NOW
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: const Text("Event here!"),
                                  ),
                                  body: const Center(
                                      child: Text(
                                          "Page showing event details here")),
                                )));
                  },

                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 4),
                            Text(eventName),
                            const SizedBox(height: 4),
                            Text(dateTime.day.toString() +
                                "/" +
                                dateTime.month.toString() +
                                "/" +
                                dateTime.year.toString() +
                                ", at " +
                                dateTime.hour.toString() +
                                ":" +
                                dateTime.minute.toString()),
                            const SizedBox(height: 4),
                            Text(org),
                          ],
                        ),
                      )),
                ),
              ),
            ));
}
