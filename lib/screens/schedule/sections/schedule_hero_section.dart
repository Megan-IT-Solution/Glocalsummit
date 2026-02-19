import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';
import '../../../utils/url_helper.dart';
import '../../../widgets/gradient_button.dart';

class ScheduleHeroSection extends StatelessWidget {
  const ScheduleHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.primary,
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
                      padding: const EdgeInsets.symmetric(vertical: 35),
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
          'Explore our 2026\nschedule',
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
          'Check out the talks, masterclasses and meetups taking place at GLOCAL Summit Dubai 2026.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Join us in Dubai this January for a first look at business future.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        GradientButton(
          text: 'Get tickets',
          onPressed: () {
            openUrl(
              "https://glocalsummit.zohobackstage.com/GlocalSummitUAE-2026#/buyTickets/selectTickets?lang=en",
            );
          },
          padding: 20,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&q=80&w=800',
      fit: BoxFit.cover,
    );
  }
}
