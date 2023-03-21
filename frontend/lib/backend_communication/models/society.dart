import 'datasets.dart';
import 'User.dart';
import 'University.dart';

//test on test screen

class Society extends dataSets {
  final User user;
  final University university; //university_studying_at
  final String name;
  final String description;
  final String created_at;
  late String image;

  final String join_date;
  // final String password;

  Society({
    int id = 0,
    required this.user,
    required this.university,
    required this.name,
    required this.description,
    required this.created_at,
    required this.join_date,
  }) : super(id: id);

  factory Society.fromJson(Map<String, dynamic> json) {
    return Society(
        user: User.fromJsonNOID(json['user']),
        university: University.fromJsonNOID(json['university_society_is_at']),
        name: json['name'],
        description: json['about_us'],
        join_date: json['join_date'],
        created_at: json['creation_date']);
  }

  factory Society.fromJsonNOID(Map<String, dynamic> json) {
    return Society(
        user: User.fromJsonNOID(json['user']),
        university: University.fromJsonNOID(json['university_society_is_at']),
        name: json['name'],
        description: json['about_us'],
        join_date: json['join_date'],
        created_at: json['creation_date']);
  }
  @override
  Databases getDatabase() {
    return Databases.society;
  }

  dynamic toJson() => {
        'user': user.toJson(),
        'university_society_is_at': university.toJson(),
        'about_us': description,
        'name': name,
        'join_date': join_date,
        'creation_date': created_at,
        'image': image
      };
}
