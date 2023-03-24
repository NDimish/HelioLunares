import 'datasets.dart';

enum UserType { Blank, NONESTUDENT, STUDENT, SOCIETY, ADMIN }

class User extends dataSets {
  final String email;
  String password = "";
  final String date_joined;
  final int userType;
  // final String password;

  User(
      {int id = 0,
      required this.email,
      required this.userType,
      required this.date_joined,
      required this.password})
      : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        userType: json['user_level'],
        date_joined: json['date_joined'],
        password: '');
  }

  factory User.fromJsonNOID(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        userType: json['user_level'],
        date_joined: json['date_joined'],
        password: '');
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }

  dynamic toJson() => {
        'email': email,
        'user_level': (userType),
        'date_joined': date_joined,
        'password': password
      };

  @override
  updateToJson() {
    print({
      'email': email,
      'password': password
    });
    return {
      'email': email,
      'password': password
    };
  }
 
}
