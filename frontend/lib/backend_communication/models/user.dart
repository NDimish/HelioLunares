import 'datasets.dart';

enum UserType { NONESTUDENT, STUDENT, SOCIETY }

class User extends dataSets {
  final String email;
  late final String password;
  final String date_joined;
  final UserType userType;
  // final String password;

  User(
      {int id = 0,
      required this.email,
      required this.userType,
      required this.date_joined})
      : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        userType: UserType.values[json['user_level'] - 1],
        date_joined: json['date_joined']);
  }

  factory User.fromJsonNOID(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        userType: UserType.values[json['user_level'] - 1],
        date_joined: json['date_joined']);
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }

  dynamic toJson() => {
        'email': email,
        'user_level': (userType.index + 1),
        'date_joined': date_joined,
        'password': password
      };
}
