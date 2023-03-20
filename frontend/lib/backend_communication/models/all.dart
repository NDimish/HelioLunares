export '../models/datasets.dart';
export 'Event.dart';
export 'People.dart';
export '../models/society.dart';
export 'user.dart';

final DATASOURCE = 'http://127.0.0.1:8000/';

class Localdata {
  String Token = "";

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }
}
