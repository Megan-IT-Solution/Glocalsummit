import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget expoHighlightSectionBenefitWidget(String text, bool isMobile) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: AppColors.headingGolden,
          size: 20,
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontSize: isMobile ? 16 : 18, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
