import 'package:bni_event/sections/widgets/audience_card_widget.dart';
import 'package:flutter/material.dart';

import '../utils/responsive_helper.dart';

class AudienceSection extends StatelessWidget {
  const AudienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          _buildHeader(isMobile),
          SizedBox(height: isMobile ? 40 : 60),
          _buildFeatureGrid(isMobile, isTablet),
          SizedBox(height: isMobile ? 40 : 60),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Column(
      children: [
        Text(
          'WHO SHOULD ATTEND?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(bool isMobile, bool isTablet) {
    final images = [
      "assets/images/w1.png",
      "assets/images/w2.png",
      "assets/images/w3.png",
      "assets/images/w4.png",
      "assets/images/w5.png",
    ];

    if (isMobile) {
      return Column(
        children: images
            .map(
              (img) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: AudienceCardWidget(image: img, isMobile: true),
              ),
            )
            .toList(),
      );
    }

    return Wrap(
      spacing: 25,
      runSpacing: 25,
      alignment: WrapAlignment.center,
      children: images
          .map(
            (img) => SizedBox(
              width: isTablet ? 320 : 250,
              child: AudienceCardWidget(image: img, isMobile: false),
            ),
          )
          .toList(),
    );
  }
}
