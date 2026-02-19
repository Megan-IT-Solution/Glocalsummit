import 'package:bni_event/screens/contact_us/contact_us_screen.dart';
import 'package:bni_event/screens/edition_2026/editions_2026_screen.dart';
import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/screens/media/media_screen.dart';
import 'package:bni_event/screens/schedule/sections/schedule_hero_section.dart';
import 'package:bni_event/screens/sponsors/sponsors_screen.dart';
import 'package:bni_event/sections/footer.dart';
import 'package:bni_event/sections/format_section.dart';
import 'package:bni_event/sections/schedule_newsletter_section.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/widgets/navbar.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation_helper.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),
                ScheduleHeroSection(),
                EventFormatSection(),
                ScheduleNewsletterSection(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onScheduleTap: () {}, // Already on Schedule
              onContactTap: () {
                navigateSmoothly(context, const ContactScreen());
              },
              onEditionsTap: () {
                navigateSmoothly(context, const Editions2026Screen());
              },
              onExpoTap: () {
                navigateSmoothly(context, const ExpoScreen());
              },
              onSponsorsTap: () {
                navigateSmoothly(context, const SponsorsScreen());
              },
              onMediaTap: () {
                navigateSmoothly(context, const MediaScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
