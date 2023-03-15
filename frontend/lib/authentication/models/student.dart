import 'package:university_ticketing_system/authentication/models/user_account.dart';

class Student {
  late UserAccount user;
  late String firstName;
  late String lastName;
  late String fieldOfStudy;
  late String university;

  Student();

  UserAccount getUserAccount() => user;
  String getFirstName() => firstName;
  String getLastName() => lastName;
  String getFieldOfStudy() => fieldOfStudy;
  String getUniversity() => university;

  void setUserAccount(UserAccount u) => user = u;
  void setFirstName(String f) => firstName = f;
  void setLastName(String l) => lastName = l;
  void setFieldOfStudy(String fos) => fieldOfStudy = fos;
  void setUniversity(String uni) => university = uni;
}
