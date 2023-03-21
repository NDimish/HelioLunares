import 'datasets.dart';

class SocietyCategoryType extends dataSets {
  final String categoryName;

  SocietyCategoryType({int id = 0, required this.categoryName}) : super(id: id);

  factory SocietyCategoryType.fromJson(Map<String, dynamic> json) {
    return SocietyCategoryType(
        id: json['id'], categoryName: json['category_name']);
  }

  factory SocietyCategoryType.fromJsonNOID(Map<String, dynamic> json) {
    return SocietyCategoryType(categoryName: json['category_name']);
  }

  @override
  Databases getDatabase() {
    return Databases.society_categories_type;
  }

  dynamic toJson() => {'id': id, 'category_name': categoryName};
}
