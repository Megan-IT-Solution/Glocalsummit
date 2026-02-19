import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';

class MediaStorySection extends StatelessWidget {
  const MediaStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: Dimensions.getSectionPadding(context),
      child: isMobile || isTablet
          ? Column(
              children: [
                _buildTextContent(context, isMobile),
                const SizedBox(height: 40),
                _buildImage(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _buildTextContent(context, isMobile)),
                const SizedBox(width: 60),
                Expanded(flex: 1, child: _buildImage(context)),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Media & Press Access',
          style: TextStyle(
            color: Colors.black,
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Glocal Summit UAE 2026 offers accredited media professionals comprehensive access to key Summit activities, interviews with speakers and delegates, and exclusive content opportunities. Media partners play a vital role in amplifying the Summit’s mission: stimulating market-driven conversations and promoting collaboration across industries and borders.',
          style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.6),
        ),
        const SizedBox(height: 20),
        Text(
          'Journalists, content creators, and press representatives are invited to apply for media credentials to attend sessions and participate in media-centric engagements throughout the day. Official press kits, speaker bios, and Summit insights will be made available to all accredited media to support high-quality reporting and coverage.',
          style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/media.jpg",
        height: 500,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
