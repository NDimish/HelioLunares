import 'package:university_ticketing_system/backend_communication/dataCollector.dart';

import 'datasets.dart';

class SocietyRole extends dataSets {
  final Society society;
  final People people;
  final int role;
  // final String password;

  SocietyRole(
      {int id = 0,
      required this.society,
      required this.role,
      required this.people})
      : super(id: id);

  factory SocietyRole.fromJson(Map<String, dynamic> json) {
    return SocietyRole(
        id: json['id'],
        society: Society.fromJsonNOID(json['society']),
        people: People.fromJsonNOID(json['user_at_society']),
        role: json['role']);
  }

  factory SocietyRole.fromJsonNOID(Map<String, dynamic> json) {
    return SocietyRole(
        society: Society.fromJsonNOID(json['society']),
        people: People.fromJsonNOID(json['user_at_society']),
        role: json['role']);
  }

  @override
  Databases getDatabase() {
    return Databases.users;
  }

  dynamic toJson() => {
        'society': society,
        'user_at_society': people,
        'role': role,
      };
}
