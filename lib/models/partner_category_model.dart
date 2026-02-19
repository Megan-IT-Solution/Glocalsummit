import 'package:bni_event/models/sponsor_model.dart';

class PartnerCategoryModel {
  final String title;
  final List<SponsorModel> sponsors;
  final bool isPremium;

  PartnerCategoryModel({
    required this.title,
    required this.sponsors,
    this.isPremium = false,
  });
}
