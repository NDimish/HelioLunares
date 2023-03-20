export '../models/datasets.dart';
export 'Event.dart';
export 'People.dart';
export '../models/society.dart';
export 'User.dart';

final DATASOURCE = 'http://heliolunares.pythonanywhere.com/';

class Localdata {
  String Token = "";

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }
}
