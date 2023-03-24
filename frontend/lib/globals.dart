const DATASOURCE = 'https://heliolunares.pythonanywhere.com/';
Localdata localdataobj = Localdata();

class Localdata {
  static String Token = "";
  static int USERLEVEL = 1;
  static int USERID = 0;

  String Email = '';

  Localdata() {}

  void setData(String token, String email, int userlevel, int userid) {
    Token = token;
    Email = email;
    USERLEVEL = userlevel;
    USERID = userid;
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

  int getUserID() {
    return USERID;
  }

  void setUserID(int userid) {
    USERID = userid;
  }
}
