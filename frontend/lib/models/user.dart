import '/models/datasets.dart';

class User extends dataSets {
  final String username;
  late final String password;
  // final String password;

  User({required int id, required this.username}) : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['email']);
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }

  dynamic toJson() => {'email': username};
}
