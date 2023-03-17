import 'package:university_ticketing_system/authentication/models/user_account.dart';

class Society {
  late UserAccount user;
  late String socName;
  late String dateCreated;
  late String universityAt;
  late String bio;
  late List<String> categories;

  Society();

  UserAccount getUserAccount() => user;
  String getSocName() => socName;
  String getUni() => universityAt;
  String getDate() => dateCreated;
  String getBio() => bio;
  List<String> getCategories() => categories;

  void setUserAccount(UserAccount u) => user = u;
  void setSocName(String s) => socName = s;
  void setUni(String uni) => universityAt = uni;
  void setDateCreated(String d) => dateCreated = d;
  void setBio(String b) => bio = b;
  void addCategory(String cat) => categories.add(cat);
}
