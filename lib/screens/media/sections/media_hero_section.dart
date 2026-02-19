import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';
import '../../../widgets/gradient_button.dart';
import '../widgets/media_partner_modal.dart';

class MediaHeroSection extends StatelessWidget {
  const MediaHeroSection({super.key});

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
                      padding: const EdgeInsets.symmetric(vertical: 45),
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
          'Media & \nHighlights',
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
          'Latest news, press releases, and media resources.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Stay updated with the latest happenings at GLOCAL Summit 2026.',
          textAlign: isMobile || isTablet ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        GradientButton(
          text: 'Become Our Media Partner',
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: 'MediaPartnerModal',
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (context, anim1, anim2) {
                return const MediaPartnerModal();
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position:
                      Tween(
                        begin: const Offset(0, 0.1),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: anim1,
                          curve: Curves.easeOutCubic,
                        ),
                      ),
                  child: FadeTransition(opacity: anim1, child: child),
                );
              },
            );
          },
          padding: 20,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset("assets/images/media.png", fit: BoxFit.cover);
  }
}
