import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget aboutGlocalSummitGlassCardWidget({
  required String title,
  required String content,
  required IconData icon,
  List<String>? points,
}) {
  return Container(
    padding: const EdgeInsets.all(35),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.headingGolden, size: 32),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.headingGolden,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        if (content.isNotEmpty)
          Text(
            content,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.6,
            ),
          ),
        if (points != null)
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.accent1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}
