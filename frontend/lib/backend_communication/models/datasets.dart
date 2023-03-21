//enumerations

enum Databases {
  users,
  event,
  university,
  people,
  society,
  ticket,
  societyrole,
  // ignore: constant_identifier_names
  event_categories_type,
  event_categories,
  society_categories_type,
  society_categories,
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
