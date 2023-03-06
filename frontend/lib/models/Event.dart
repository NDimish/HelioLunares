import '/models/datasets.dart';

class Event extends dataSets {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;
  // final String password;

  Event(
      {required this.title,
      required this.date,
      required this.time,
      required this.venue,
      required this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        title: json['event_name'],
        date: (json['event_date'].split('T')[0]),
        time: (json['event_date'].split('T')[1]),
        venue: json['location'],
        description: json['description']);
  }

  @override
  Databases getDatabase() {
    return Databases.event;
  }
}
