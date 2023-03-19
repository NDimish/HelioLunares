//Society Event Model
class SocietyEvent {
  late String name;
  late String price;
  late String date;
  late String location;
  late String duration;
  late String description;

  SocietyEvent(String name, String price, String date, String location,
      String _duration, String _description) {
    this.name = name;
    this.price = price;
    this.date = date;
    this.location = location;
    this.duration = _duration;
    this.description = _description;
  }
}
