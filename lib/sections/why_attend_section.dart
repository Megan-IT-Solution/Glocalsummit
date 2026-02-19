import 'package:bni_event/sections/widgets/why_attend_section_content_widget.dart';
import 'package:bni_event/sections/widgets/why_attend_section_image_widget.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/responsive_helper.dart';

class WhyAttendSection extends StatelessWidget {
  const WhyAttendSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1512453979798-5eaad0ff3e01?auto=format&fit=crop&q=80&w=1470',
          ),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      padding: Dimensions.getSectionPadding(context),
      child: isMobile || isTablet
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                whyAttendSectionContentWidget(isMobile, isTablet),
                const SizedBox(height: 40),
                whyAttendSectionImageWidget(isMobile),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: whyAttendSectionContentWidget(isMobile, isTablet),
                ),
                const SizedBox(width: 80),
                Expanded(child: whyAttendSectionImageWidget(isMobile)),
              ],
            ),
    );
  }
}
