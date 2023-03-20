const DATASOURCE = 'http://127.0.0.1:8000/';
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

  void setToken(String token) {
    Token = token;
  }
}
