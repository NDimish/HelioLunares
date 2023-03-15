import 'package:flutter/material.dart';

class SocietyEventsPage extends StatelessWidget {
  final String societyName;

  SocietyEventsPage({required this.societyName});

  final List<Event> events = [
    Event(
      name: 'Painting Workshop',
      description:
          'Join us for a workshop on watercolor painting techniques!',
      date: 'Saturday, April 2, 2022',
    ),
    Event(
      name: 'Movie Night',
      description: 'Come watch a movie with us and enjoy some popcorn!',
      date: 'Friday, April 8, 2022',
    ),
    Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
     Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
     Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
     Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
     Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
     Event(
      name: 'Book Club Meeting',
      description: 'We will be discussing "To Kill a Mockingbird" this month.',
      date: 'Monday, April 18, 2022',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(societyName),
      ),
      
      body: 
ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    events[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    events[index].description,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Date: ${events[index].date}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String description;
  final String date;

  Event({
    required this.name,
    required this.description,
    required this.date,
  });
}








