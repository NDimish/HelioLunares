export '../models/datasets.dart';
export 'Event.dart';
export 'People.dart';
export '../models/society.dart';
export 'User.dart';

final DATASOURCE = 'http://127.0.0.1:8000/';

class Cookies {
  static String Token = "";

  static String Email = '';

  static void eatCookies(String Token, String email) {
    Token = Token;
    Email = email;
  }
}
