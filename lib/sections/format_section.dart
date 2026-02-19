import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/responsive_helper.dart';
import '../utils/dimensions.dart';

class EventFormatSection extends StatelessWidget {
  const EventFormatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            'EVENT FORMAT AT A GLANCE',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          isMobile || isTablet
              ? Column(
                  children: [
                    _buildTimeBlock(isMobile),
                    const SizedBox(height: 30),
                    _buildImageSection(isMobile, isDesktop: false),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _buildTimeBlock(isMobile)),
                      const SizedBox(width: 60),
                      Expanded(
                        child: _buildImageSection(isMobile, isDesktop: true),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildTimeBlock(bool isMobile) {
    final items = [
      'Registration & Welcome Networking',
      'Opening Session',
      'Industry Expert Panel Discussion',
      'Business Expo & Showcases',
      'Structured & Speed Networking',
      'Open Networking & Collaboration',
      'Summit Wrap-up',
    ];

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                color: AppColors.headingGolden,
                size: isMobile ? 28 : 32,
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  '9:00 AM – 4:00 PM',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      color: AppColors.headingGolden,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
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

  Widget _buildImageSection(bool isMobile, {required bool isDesktop}) {
    final height = isDesktop ? double.infinity : (isMobile ? 300.0 : 500.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          SizedBox(
            height: height,
            child: Image.asset(
              'assets/images/schedule.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience the Energy',
                  style: TextStyle(
                    color: AppColors.headingGolden,
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Join industry leaders and innovators in a dynamic environment designed for growth.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
