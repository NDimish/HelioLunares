/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the user model and is used to simplify storing the data
/// of the user account when signing up.
class UserAccount {
  late String email;
  late String password;
  late String confirmedPassword;

  UserAccount();

  String getEmail() => email;
  String getPassword() => password;
  String getConfirmedPassword() => confirmedPassword;

  void setEmail(String e) => email = e;
  void setPassword(String p) => password = p;
  void setConfirmedPassword(String cP) => confirmedPassword = cP;
}
