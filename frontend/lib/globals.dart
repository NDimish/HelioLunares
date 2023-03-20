const DATASOURCE = 'http://heliolunares.pythonanywhere.com/';
Localdata localdataobj = Localdata();

class Localdata {
  static String Token = "";

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }

  String getToken() {
    return Token;
  }
}
