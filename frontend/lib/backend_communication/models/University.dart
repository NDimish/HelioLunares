import 'datasets.dart';

class University extends dataSets {
  final String name;
  final double latitude;
  final double longitude;
  final String street_name;
  final String postcode;
  // final String password;

  University({
    int id = 0,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.street_name,
    required this.postcode,
  }) : super(id: id);

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      street_name: json['street_name'],
      postcode: json['postcode'],
    );
  }

  factory University.fromJsonNOID(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      street_name: json['street_name'],
      postcode: json['postcode'],
    );
  }

  @override
  Databases getDatabase() {
    return Databases.university;
  }

  dynamic toJson() => {
        'name': name,
        // 'duration': duration,
        ' latitude': latitude,
        'longitude': longitude,
        'street_name': street_name,
        'postcode': postcode,
      };
}
