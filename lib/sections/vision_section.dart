import 'package:bni_event/sections/widgets/vision_feature_card_widget.dart';
import 'package:flutter/material.dart';

import '../utils/responsive_helper.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

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
          _buildFooter(isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Column(
      children: [
        Text(
          'INSPIRED BY A SIMPLE\nBUT POWERFUL VISION',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'GLOCAL Summit UAE is inspired by a clear vision —\n'
          'to support SMEs, startups, and growing businesses by providing:',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: isMobile ? 16 : 20, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(bool isMobile, bool isTablet) {
    final images = [
      "assets/images/v1.png",
      "assets/images/v2.png",
      "assets/images/v3.png",
      "assets/images/v4.png",
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
                child: VisionFeatureCardWidget(image: img, isMobile: true),
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
              child: VisionFeatureCardWidget(image: img, isMobile: false),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFooter(bool isMobile) {
    return Column(
      children: [
        Text(
          'When businesses grow, innovation accelerates,\n'
          'partnerships multiply, and economies strengthen.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            height: 1.6,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "GLOCAL Summit is built as a long-term business platform, not a one-day event.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
