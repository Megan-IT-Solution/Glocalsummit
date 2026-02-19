import 'package:flutter/material.dart';

import '../../theme/colors.dart';

Widget aboutGlocalSummitPhilosophyCardWidget(Map<String, dynamic> p) {
  return Container(
    height: 280,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: NetworkImage(p['image'] as String),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withValues(alpha: .3),
          BlendMode.srcATop,
        ),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.4),
            Colors.black.withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (p['title'] as String).toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.headingGolden,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            p['desc'] as String,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    ),
  );
}
