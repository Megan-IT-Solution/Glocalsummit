import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/sections/widgets/expo_highlight_section_benefit_widget.dart';
import 'package:bni_event/utils/navigation_helper.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/dimensions.dart';
import '../utils/responsive_helper.dart';
import '../widgets/gradient_button.dart';

class ExpoHighlightSection extends StatelessWidget {
  const ExpoHighlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?auto=format&fit=crop&q=80&w=1470',
          ),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BUSINESS EXPO HIGHLIGHT',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: AppColors.headingGolden,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Showcase Your Business to\nDecision-Makers',
            style: TextStyle(
              fontSize: isMobile ? 28 : (isTablet ? 38 : 48),
              fontWeight: FontWeight.bold,
              color: AppColors.headingGolden,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'The Glocal Summit Business Expo provides selected businesses with a platform to increase brand visibility, generate qualified leads, and build strategic partnerships.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white70,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          expoHighlightSectionBenefitWidget(
            'Increase brand visibility',
            isMobile,
          ),
          expoHighlightSectionBenefitWidget(
            'Generate qualified leads',
            isMobile,
          ),
          expoHighlightSectionBenefitWidget(
            'Build strategic partnerships',
            isMobile,
          ),
          expoHighlightSectionBenefitWidget(
            'Strengthen market presence',
            isMobile,
          ),
          SizedBox(height: isMobile ? 30 : 20),
          Text(
            "Both established companies and growth-stage businesses participate in the Expo.",

            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white70,
              height: 1.6,
            ),
          ),

          SizedBox(height: isMobile ? 30 : 40),

          GradientButton(
            text: 'Apply for Expo Participation',
            onPressed: () {
              navigateSmoothly(context, const ExpoScreen());
            },
            padding: isMobile ? 20 : 20,
          ),
        ],
      ),
    );
  }
}
