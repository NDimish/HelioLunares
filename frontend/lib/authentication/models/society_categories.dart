class SocietyCateogry {
  final int id;
  final String categoryName;

  const SocietyCateogry({
    required this.id,
    required this.categoryName,
  });

  String getCategoryName() => categoryName;

  factory SocietyCateogry.fromJson(Map<String, dynamic> json) {
    return SocietyCateogry(
      id: json['id'],
      categoryName: json['category_name'],
    );
  }
}
