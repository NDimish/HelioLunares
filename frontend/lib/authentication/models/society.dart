import 'package:university_ticketing_system/authentication/models/user_account.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the society model and is used to simplify storing the data
/// of the society account when signing up.
class Society {
  late UserAccount user;
  late String socName;
  late String dateCreated;
  late String universityAt;
  late int universityAtId;
  late String bio;
  late List<String> categories;

  Society();

  UserAccount getUserAccount() => user;
  String getSocName() => socName;
  String getUni() => universityAt;
  int getUniId() => universityAtId;
  String getDate() => dateCreated;
  String getBio() => bio;
  List<String> getCategories() => categories;

  void setUserAccount(UserAccount u) => user = u;
  void setSocName(String s) => socName = s;
  void setUni(String uni) => universityAt = uni;
  void setDateCreated(String d) => dateCreated = d;
  void setBio(String b) => bio = b;
  void setUniId(int id) => universityAtId = id;
  void addCategory(String cat) => categories.add(cat);
}
