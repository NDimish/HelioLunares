//enumerations

enum Databases {
  users,
  event,
  usersadd,
}

// userrsadd is temp unrtil auth working
enum Tag {
  E,
}

enum OrderType {
  CHRONOLOGICAL,
}

abstract class dataSets {
  dataSets() {}

  Databases getDatabase() {
    return Databases.users;
  }
}
