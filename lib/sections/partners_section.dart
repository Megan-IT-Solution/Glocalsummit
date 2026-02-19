import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/dimensions.dart';
import '../utils/responsive_helper.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    final logos = [
      'assets/logos/tp1.jpeg',
      'assets/logos/ep1.jpeg',
      'assets/logos/mp1.jpeg',
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            "They've attended as partners",
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 20 : 40,
            runSpacing: isMobile ? 20 : 40,
            children: logos
                .map((logo) => _buildStyledLogo(logo, isMobile))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStyledLogo(String assetPath, bool isMobile) {
    return Container(
      width: isMobile ? 180 : 250,
      height: isMobile ? 120 : 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(Icons.business, color: Colors.grey[300], size: 40),
          );
        },
      ),
    );
  }
}
