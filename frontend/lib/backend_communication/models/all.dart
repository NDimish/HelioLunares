export '../models/datasets.dart';
export 'Event.dart';
export '../models/student.dart';
export '../models/society.dart';
export 'User.dart';

final DATASOURCE = 'http://127.0.0.1:8000/';

class Cookies {
  static String CSRFToken = "R0NlY0zcSdMqvrIC5Wse64gh4NCHQQIa";
  //b4c3db9077b18156a328f775604297a5970aaa34
  static String Cookie = 'ajuyaoesw7pbd2afqi5dvi8p8x6ngv6v';

  static String Email = '';

  static void eatCookies(String csrfToken, String cookie, String email) {
    CSRFToken = csrfToken;
    Cookie = cookie;
    Email = email;
  }
}
