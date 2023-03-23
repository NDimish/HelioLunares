import 'dart:convert';

import 'datasets.dart';
import 'Society.dart';

class Event extends dataSets {
  String title;
  String date;
  String time;
  int attendance;
  String venue;
  String description;

  Society society;
  double duration;
  double price;
  String update_time;
  String create_time;
  // final String password;

  Event(
      {int id = 0,
      required this.society,
      required this.attendance,
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
        attendance: json['attendance'],
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
        attendance: json['attendance'],
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
        'attendance': attendance
      };

  void setTitle(String title) {
    this.title = title;
  }

  void setPrice(double price) {
    this.price = price;
  }

  void setDate(String date) {
    this.date = date;
  }

  void setTime(String time) {
    this.time = time;
  }

  void setVenue(String venue) {
    this.venue = venue;
  }

  void setDuration(double duration) {
    this.duration = duration;
  }

  void setDescription(String description) {
    this.description = description;
  }

  String getDateTime(String timeString, String dateString) {
    String dateTimeString = '$dateString $timeString';

    // Convert to DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Convert to JSON
    String json = jsonEncode({'datetime': dateTime.toIso8601String()});
    return json;
  }

  @override
  updateToJson() {
    return {
      'duration': duration,
      'price': price,
      'update_time': update_time,
      'create_time': create_time,
      'event_name': title,
      'event_date': "${date} ${time}:00",
      'location': venue,
      'description': description,
      'attendance': attendance
    };
  }

  @override
  createJson() {
    print(date);
    print(time);
    return {
      "society_id": society.id,
      "duration": duration,
      "event_date": "${date} ${time}:00",
      "event_name": title,
      "location": venue,
      "description": description,
      "price": price
    };
  }
}
