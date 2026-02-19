class SponsorModel {
  final String name;
  final String description;
  final String logoUrl;
  final String? category;

  SponsorModel({
    required this.name,
    required this.description,
    required this.logoUrl,
    this.category,
  });
}
