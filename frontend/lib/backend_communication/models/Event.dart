import 'datasets.dart';

class Event extends dataSets {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;

  final String society_email;
  final double duration;
  final double price;
  final String update_time;
  final String create_time;
  // final String password;

  Event(
      {required int id,
      required this.society_email,
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
        society_email: json['society_email'],
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
        'society_email': society_email,
        // 'duration': duration,
        'price': price,
        'update_time': update_time,
        'create_time': create_time,
        'event_name': title,
        'event_date': ('${date}T$time'),
        'location': venue,
        'description': description
      };
}
