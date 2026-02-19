import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget aboutGlocalSectionGradientHeader(String text, bool isMobile) {
  return Column(
    children: [
      Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isMobile ? 28 : 42,
          fontWeight: FontWeight.w900,
          color: AppColors.headingGolden,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: 80,
        height: 4,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.headingGolden, AppColors.accent1],
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    ],
  );
}
