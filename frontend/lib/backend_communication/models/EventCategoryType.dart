import 'datasets.dart';

class EventCategoryType extends dataSets {
  final String categoryName;

  EventCategoryType({int id = 0, required this.categoryName}) : super(id: id);

  factory EventCategoryType.fromJson(Map<String, dynamic> json) {
    return EventCategoryType(
        id: json['id'], categoryName: json['category_name']);
  }

  factory EventCategoryType.fromJsonNOID(Map<String, dynamic> json) {
    return EventCategoryType(categoryName: json['category_name']);
  }

  @override
  Databases getDatabase() {
    return Databases.event_categories_type;
  }

  dynamic toJson() => {'id': id, 'category_name': categoryName};

@override
   updateToJson() {return{'id': id, 'category_name': categoryName};}
}
