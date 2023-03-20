import 'datasets.dart';
import 'user.dart';
import 'Event.dart';

//test on test screen

class Tickets extends dataSets {
  final User user;
  final Event event; //university_studying_at
  final String date;
  final int price;

  // final String password;

  Tickets(
      {required int id,
      required this.user,
      required this.event,
      required this.date,
      required this.price})
      : super(id: id);

  factory Tickets.fromJson(Map<String, dynamic> json) {
    return Tickets(
        id: json['id'],
        user: User.fromJson(json['user']),
        event: Event.fromJson(json['event']),
        date: json['date'],
        price: json['price']);
  }

  @override
  Databases getDatabase() {
    return Databases.people;
  }

  dynamic toJson() => {
        'user': user.toJson(),
        'event': event.toJson(),
        'date': date,
        'price': price,
      };
}
