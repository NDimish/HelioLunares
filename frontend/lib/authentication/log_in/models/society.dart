import 'package:rd3/authentication/models/user_account.dart';

class Society {
  late UserAccount user;
  late String socName;
  late String dateCreated;
  late String universityAt;

  Society();

  UserAccount getUserAccount() => user;
  String getSocName() => socName;
  String getUni() => universityAt;
  String getDate() => dateCreated;

  void setUserAccount(UserAccount u) => user = u;
  void setSocName(String s) => socName = s;
  void setUni(String uni) => universityAt = uni;
  void setDateCreated(String d) => dateCreated = d;
}
