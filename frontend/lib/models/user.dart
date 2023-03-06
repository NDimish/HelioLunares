import '/models/datasets.dart';

class User extends dataSets {
  final int id;
  final String username;
  // final String password;

  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['email']);
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }
}
