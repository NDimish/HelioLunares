export '../models/datasets.dart';
export 'Event.dart';
export 'People.dart';
export '../models/society.dart';
export 'User.dart';
export 'societyRole.dart';

final DATASOURCE = 'http://localhost:8000/';

class Localdata {
  String Token = "";

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }
}
