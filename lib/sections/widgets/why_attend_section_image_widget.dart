import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget whyAttendSectionImageWidget(bool isMobile) {
  if (isMobile) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://images.unsplash.com/photo-1546412414-e1885259563a?auto=format&fit=crop&q=80&w=800',
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            _buildStatCard('200+', 'Business Leaders'),
            const SizedBox(height: 15),
            _buildStatCard(
              '350+',
              'Business Owners, Entrepreneurs, Startups & Investors',
            ),
          ],
        ),
      ],
    );
  }

  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 40, bottom: 40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://images.unsplash.com/photo-1546412414-e1885259563a?auto=format&fit=crop&q=80&w=800',
            fit: BoxFit.cover,
            height: 400,
            width: 500,
          ),
        ),
      ),
      Positioned(
        top: 40,
        right: 0,
        child: _buildStatCard('200+', 'Business Leaders'),
      ),
      Positioned(
        bottom: 0,
        right: 40,
        child: _buildStatCard(
          '350+',
          'Business Owners \nEntrepreneurs, Startups & Investors',
        ),
      ),
    ],
  );
}

Widget _buildStatCard(String val, String label) {
  return Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          val,

          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.headingGolden,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    ),
  );
}
