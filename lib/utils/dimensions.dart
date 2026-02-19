import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class Dimensions {
  static EdgeInsets getSectionPadding(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return EdgeInsets.symmetric(
      vertical: isMobile ? 60 : 90,
      horizontal: isMobile ? 40 : (isTablet ? 60 : 120),
    );
  }
}
