import 'datasets.dart';
import 'SocietyCategoryType.dart';
import 'Society.dart';

class SocietyCategories extends dataSets {
  final SocietyCategoryType societyCategory;
  final Society society;

  SocietyCategories(
      {int id = 0, required this.societyCategory, required this.society})
      : super(id: id);

  factory SocietyCategories.fromJson(Map<String, dynamic> json) {
    return SocietyCategories(
        id: json['id'],
        societyCategory: SocietyCategoryType.fromJson(json['categoryId']),
        society: Society.fromJson(json['societyId']));
  }

  factory SocietyCategories.fromJsonNOID(Map<String, dynamic> json) {
    return SocietyCategories(
        societyCategory: SocietyCategoryType.fromJsonNOID(json['categoryId']),
        society: Society.fromJsonNOID(json['eventId']));
  }

  @override
  Databases getDatabase() {
    return Databases.society_categories;
  }

  dynamic toJson() =>
      {'id': id, 'society': society, 'category': societyCategory};
}
