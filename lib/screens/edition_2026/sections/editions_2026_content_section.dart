import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/utils/dimensions.dart';
import 'package:bni_event/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class EditionsContentSection extends StatelessWidget {
  const EditionsContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/expo.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.8),
            BlendMode.darken,
          ),
        ),
      ),
      padding: Dimensions.getSectionPadding(
        context,
      ).copyWith(top: 80, bottom: 80),
      child: Column(
        children: [
          _buildWhiteCard(
            context: context,
            isMobile: isMobile,
            isTablet: isTablet,
            title: 'Event Overview',
            description:
                'A curated one-day business summit and expo connecting growth-focused SMEs, '
                'startups, investors and decision-makers under one roof.',
            image: 'assets/images/ev.jpeg',
            bullets: const [
              'One-day Business Summit & Expo',
              'Curated audience of business leaders, entrepreneurs, startups, and investors',
            ],
          ),
          const SizedBox(height: 40),
          _buildWhiteCard(
            context: context,
            isMobile: isMobile,
            isTablet: isTablet,
            title: 'Attendance Snapshot',
            description:
                'A carefully balanced mix of business leaders, entrepreneurs, investors and ecosystem enablers – designed to maximise quality conversations.',
            image: 'assets/images/as.jpeg',
            stats: const [
              {
                'value': '200+',
                'label': 'Invited business leaders & decision-makers',
              },
              {
                'value': '350+',
                'label': 'Business owners, founders, startups & professionals',
              },
              {
                'value': '550+',
                'label': 'Total participants across the full GLOCAL experience',
              },
            ],
          ),
          const SizedBox(height: 40),
          _buildWhiteCard(
            context: context,
            isMobile: isMobile,
            isTablet: isTablet,
            title: 'What to Expect in 2026',
            description:
                'GLOCAL Summit 2026 levels up the experience with more content, '
                'curated matches and stronger business outcomes.',
            image: 'assets/images/expect.jpeg',
            bullets: const [
              'Expanded business Expo',
              'Practical Knowledge & Skill Sharing',
              'Stronger sponsor and partner presence',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteCard({
    required BuildContext context,
    required bool isMobile,
    required bool isTablet,
    required String title,
    required String description,
    required String image,
    List<String>? bullets,
    List<Map<String, String>>? stats,
  }) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: isMobile ? 16 : 18,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 25),
        if (bullets != null) ...bullets.map((b) => _buildListItem(b, isMobile)),
        if (stats != null) ...stats.map((s) => _buildStatItem(s, isMobile)),
      ],
    );

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        image,
        height: isMobile ? 250 : 350,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: isMobile
          ? Column(children: [imageWidget, const SizedBox(height: 30), content])
          : Row(
              children: [
                Expanded(flex: 2, child: imageWidget),
                const SizedBox(width: 50),
                Expanded(flex: 3, child: content),
              ],
            ),
    );
  }

  Widget _buildListItem(String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(Map<String, String> stat, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: isMobile ? 14 : 16,
                  height: 1.4,
                  fontFamily: 'Roboto',
                ),
                children: [
                  TextSpan(
                    text: '${stat['value']} ',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: stat['label'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
