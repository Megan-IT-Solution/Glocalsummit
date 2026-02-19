import 'package:bni_event/models/partner_category_model.dart';
import 'package:bni_event/screens/sponsors/widgets/partner_logo_card_widget.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:flutter/material.dart';

class CategorySectionWidget extends StatelessWidget {
  final PartnerCategoryModel category;
  final bool isMobile;

  const CategorySectionWidget({
    super.key,
    required this.category,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Text(
            category.title.toUpperCase(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: isMobile ? 22 : 30,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 15 : 15,
            runSpacing: isMobile ? 15 : 15,
            children: category.sponsors
                .map(
                  (sponsor) => PartnerLogoCardWidget(
                    sponsor: sponsor,
                    isMobile: isMobile,
                    isPremium: category.isPremium,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
