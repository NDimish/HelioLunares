import 'datasets.dart';
import 'User.dart';
import 'University.dart';

//test on test screen

class People extends dataSets {
  final User user;
  University university; //university_studying_at
  final String first_name;
  final String last_name;

  final String field_of_study;
  // final String password;

  People(
      {int id = 0,
      required this.user,
      required this.university,
      required this.first_name,
      required this.last_name,
      required this.field_of_study})
      : super(id: id);

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
        user: User.fromJson(json['user']),
        university: University.fromJson(json['university_studying_at']),
        first_name: json['first_name'],
        last_name: json['last_name'],
        field_of_study: json['field_of_study']);
  }

  factory People.fromJsonNOID(Map<String, dynamic> json) {
    return People(
        user: User.fromJsonNOID(json['user']),
        university: University.fromJson(json['university_studying_at']),
        first_name: json['first_name'],
        last_name: json['last_name'],
        field_of_study: json['field_of_study']);
  }

  @override
  Databases getDatabase() {
    return Databases.people;
  }

  dynamic toJson() => {
        'user': user.toJson(),
        'university_studying_at': university.toJson(),
        'first_name': first_name,
        'last_name': last_name,
        'field_of_study': field_of_study
      };
}
