//enumerations

enum Databases {
  users,
  event,
  university,
  people,
  society,
  tickets,
  societyrole
}

// userrsadd is temp unrtil auth working
enum Tag {
  E,
}

enum OrderType {
  CHRONOLOGICAL,
}

enum Relatiions {
  HOSTS,
}

abstract class dataSets {
  final int id;

  dataSets({required this.id});

  Databases getDatabase() {
    return Databases.users;
  }
}
