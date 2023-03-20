const DATASOURCE = 'http://heliolunares.pythonanywhere.com/';
Localdata localdataobj = Localdata();

class Localdata {
  static String Token = "";
  static int USERLEVEL = 1;

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }

  String getToken() {
    return Token;
  }

  void setToken(String token) {
    Token = token;
  }

  int getUserLevel() {
    return USERLEVEL;
  }

  void setUserLevel(int userlevel) {
    USERLEVEL = userlevel;
  }
}
