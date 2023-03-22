import 'datasets.dart';
import 'EventCategoryType.dart';
import 'Event.dart';

class EventCategories extends dataSets {
  final EventCategoryType eventCategory;
  final Event event;

  EventCategories(
      {int id = 0, required this.eventCategory, required this.event})
      : super(id: id);

  factory EventCategories.fromJson(Map<String, dynamic> json) {
    return EventCategories(
        id: json['id'],
        eventCategory: EventCategoryType.fromJson(json['categoryId']),
        event: Event.fromJson(json['eventId']));
  }

  factory EventCategories.fromJsonNOID(Map<String, dynamic> json) {
    return EventCategories(
        eventCategory: EventCategoryType.fromJson(json['categoryId']),
        event: Event.fromJsonNOID(json['eventId']));
  }

  @override
  Databases getDatabase() {
    return Databases.event_categories;
  }

  dynamic toJson() => {'id': id, 'event': event, 'category': eventCategory};
}
