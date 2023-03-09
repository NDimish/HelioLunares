export '../models/datasets.dart';
export 'Event.dart';
export '../models/student.dart';
export '../models/society.dart';
export 'User.dart';

final DATASOURCE = 'http://127.0.0.1:8000/';

class Cookies {
  static String CSRFToken = "";

  static String Cookie = '';

  static String Email = '';

  static void eatCookies(String csrfToken, String cookie, String email) {
    CSRFToken = csrfToken;
    Cookie = cookie;
    Email = email;
  }
}
