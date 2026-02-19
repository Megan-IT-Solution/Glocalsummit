import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';

class ExpoContentSection extends StatelessWidget {
  const ExpoContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Column(
      children: [
        // _buildSection3(context, isMobile, isTablet),
        _buildSection1(context, isMobile, isTablet),
        _buildSection2(context, isMobile, isTablet),
      ],
    );
  }

  TextStyle _boldGoldStyle(double fontSize) => TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    letterSpacing: 1.0,
    fontFamily: 'Roboto',
  );

  Widget _buildSection1(BuildContext context, bool isMobile, bool isTablet) {
    final benefits = [
      {
        'title': 'SMEs & Growing\n Businesses',
        'desc':
            'The region\'s leading media publications and journalists join GLOCAL Summit looking for the next big news story.',
        'image': 'assets/images/e1.jpeg',
      },
      {
        'title': 'Startups \n ',
        'desc':
            'Investor to startup meetings are pre-scheduled sessions between the world\'s most influential investors and the startups.',
        'image': 'assets/images/funding.png',
      },
      {
        'title': 'Professional Service\n Firms',
        'desc':
            'Networking opportunities are woven through every GLOCAL Summit experience. Reach out to investors through our app.',
        'image': 'assets/images/e3.jpeg',
      },
      {
        'title': 'Technology & Solution \n Providers',
        'desc':
            'Schedule meetings with founders who\'ve overcome all the odds. Connect with the leaders of trendsetting companies.',
        'image': 'assets/images/e4.jpeg',
      },
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFE66465), Color(0xFF9198E5)],
        ),
      ),
      padding: Dimensions.getSectionPadding(context).copyWith(top: 40),
      child: Column(
        children: [
          Text(
            'Who Can Exhibit?'.toUpperCase(),
            style: _boldGoldStyle(
              isMobile ? 24 : 36,
            ).copyWith(color: Colors.white),
          ),
          SizedBox(height: 40),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
              crossAxisSpacing: 24,
              mainAxisSpacing: 40,
              childAspectRatio: isMobile ? 0.9 : 0.62,
            ),
            itemCount: benefits.length,
            itemBuilder: (context, index) {
              final benefit = benefits[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(benefit['image']!),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    benefit['title']!.toUpperCase(),
                    style: _boldGoldStyle(18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    benefit['desc']!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection2(BuildContext context, bool isMobile, bool isTablet) {
    final steps = [
      {
        'title': 'Direct Access to Decision-Makers',
        'desc':
            'One of our startup experts will be in touch to discuss your company and objectives.',
        'image': 'assets/images/chat_specialist.png',
      },
      {
        'title': 'Brand Visibility throughout the day',
        'desc':
            'Our team dedicates hours to finding the most exciting, high-potential startups.',
        'image': 'assets/images/e6.jpeg',
      },
      {
        'title': 'Leads Generations & Partnerships',
        'desc':
            'Your dedicated success manager will work with you to help guide you through.',
        'image': 'assets/images/e7.jpeg',
      },
      {
        'title': 'Strong Recall in Primium Environment',
        'desc':
            'Now for the main event! Fill your time with activations: PITCH, Mentor Hours, and more.',
        'image': 'assets/images/e8.jpeg',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            'What happens when I apply?'.toUpperCase(),
            style: _boldGoldStyle(
              isMobile ? 24 : 36,
            ).copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
              crossAxisSpacing: 24,
              mainAxisSpacing: 40,
              childAspectRatio: isMobile ? 1.0 : 0.68,
            ),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final step = steps[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(step['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    step['title']!,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    step['desc']!,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildSection3(BuildContext context, bool isMobile, bool isTablet) {
  //   return Container(
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.centerLeft,
  //         end: Alignment.centerRight,
  //         colors: [Color(0xFFE66465), Color(0xFF9198E5)],
  //       ),
  //     ),
  //     padding: Dimensions.getSectionPadding(context),
  //     child: isMobile
  //         ? Column(
  //             children: [
  //               _buildIntroContent(isMobile),
  //               const SizedBox(height: 40),
  //               _buildIntroImage(isMobile),
  //             ],
  //           )
  //         : Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Expanded(child: _buildIntroContent(isMobile)),
  //               const SizedBox(width: 60),
  //               Expanded(child: _buildIntroImage(isMobile)),
  //             ],
  //           ),
  //   );
  // }

  // Widget _buildIntroContent(bool isMobile) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'What is GLOCAL Summit\'s startup programme?'.toUpperCase(),
  //         style: _boldGoldStyle(isMobile ? 28 : 42),
  //       ),
  //       const SizedBox(height: 30),
  //       Text(
  //         'Our startup programme gives you the chance to join a global community of startups, each one selected by the GLOCAL Summit team for its potential, uniqueness and world-changing ideas.',
  //         style: TextStyle(
  //           color: Colors.white.withOpacity(0.95),
  //           fontSize: 17,
  //           height: 1.6,
  //         ),
  //       ),
  //       const SizedBox(height: 20),
  //       Text(
  //         'If selected, you\'ll get three tickets to GLOCAL Summit and you\'ll be eligible to take part in investor to startup meetings, startup masterclasses, PITCH, Mentor Hours and much more.',
  //         style: TextStyle(
  //           color: Colors.white.withOpacity(0.95),
  //           fontSize: 17,
  //           height: 1.6,
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //       GradientButton(
  //         text: 'Apply for Startup Programme',
  //         onPressed: () {},
  //         padding: 24,
  //       ),
  //     ],
  //   );
  // }
}
