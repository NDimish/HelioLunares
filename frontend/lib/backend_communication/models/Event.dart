import 'datasets.dart';
import 'Society.dart';

class Event extends dataSets {
  final String title;
  final String date;
  final String time;
  final int ticket_amount;
  final String venue;
  final String description;

  final Society society;
  final double duration;
  final double price;
  final String update_time;
  final String create_time;
  // final String password;

  Event(
      {int id = 0,
      required this.society,
      required this.ticket_amount,
      required this.duration,
      required this.price,
      required this.update_time,
      required this.create_time,
      required this.title,
      required this.date,
      required this.time,
      required this.venue,
      required this.description})
      : super(id: id);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        society: Society.fromJson(json['society_id']),
        ticket_amount: json['attendance'],
        duration: json['duration'],
        price: json['price'],
        update_time: json['update_time'],
        create_time: json['create_time'],
        title: json['event_name'],
        date: (json['event_date'].split('T')[0]),
        time: (json['event_date'].split('T')[1]),
        venue: json['location'],
        description: json['description']);
  }

  factory Event.fromJsonNOID(Map<String, dynamic> json) {
    return Event(
        society: Society.fromJson(json['society_id']),
        ticket_amount: json['attendance'],
        duration: json['duration'],
        price: json['price'],
        update_time: json['update_time'],
        create_time: json['create_time'],
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

  dynamic toJson() => {
        'society_id': society.toJson(),
        'duration': duration,
        'price': price,
        'update_time': update_time,
        'create_time': create_time,
        'event_name': title,
        'event_date': ('${date}T$time'),
        'location': venue,
        'description': description,
        'attendance': ticket_amount
      };
}
