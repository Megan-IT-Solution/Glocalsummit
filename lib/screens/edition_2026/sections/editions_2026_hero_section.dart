import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';

class Editions2026HeroSection extends StatelessWidget {
  const Editions2026HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.primary,
      // Remove vertical padding from container to allow image to touch edges
      padding: Dimensions.getSectionPadding(
        context,
      ).copyWith(top: 0, bottom: 0),
      child: isMobile || isTablet
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: isMobile ? 50 : 70),
                  child: _buildTextContent(context, isMobile, isTablet),
                ),
                // Fixed height for mobile image
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: _buildImage(),
                ),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 90),
                      child: _buildTextContent(context, isMobile, isTablet),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(flex: 1, child: _buildImage()),
                ],
              ),
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: isMobile || isTablet
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'GLOCAL Summit\n2026 Editions',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: AppColors.headingGolden,
            fontSize: isMobile ? 36 : (isTablet ? 46 : 56),
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Discover our upcoming editions in Dubai and beyond.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Be part of the global business transformation.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      "assets/images/edition.png",
      fit: BoxFit.cover,
      // Do not specify double.infinity here as it conflicts with IntrinsicHeight
    );
  }
}
