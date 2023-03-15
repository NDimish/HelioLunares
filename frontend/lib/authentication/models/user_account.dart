class UserAccount {
  //late String email;
  String email = "f";
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
