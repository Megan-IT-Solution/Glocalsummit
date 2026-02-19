import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF08012D); // Deep Navy
  static const Color headingGolden = Color(0xFFD1BD81); // Golden
  static const Color accent1 = Color(0xFFB21952); // Magenta
  static const Color accent2 = Color(0xFF6B70C3); // Indigo
  static const Color background = Color(0xFF08012D);
  static const Color surface = Color(
    0xFF130D3D,
  ); // Lighter Navy for surface/cards
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA0A0A0);

  static const Color meshBackground = Color(0xFF08012D);
  static const Color meshCyan = Color(0xFF00D1FF);

  static const LinearGradient meshGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0135), // Primary
      Color(0xFFB31B54), // Magenta
      Color(0xFF00D1FF), // Cyan
    ],
    stops: [0.2, 0.6, 1.0],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      accent1, // Magenta
      meshCyan, // Cyan
    ],
  );
}
