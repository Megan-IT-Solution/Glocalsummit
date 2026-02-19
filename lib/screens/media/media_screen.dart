import 'package:bni_event/screens/contact_us/contact_us_screen.dart';
import 'package:bni_event/screens/edition_2026/editions_2026_screen.dart';
import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/screens/media/sections/media_hero_section.dart';
import 'package:bni_event/screens/media/sections/media_story_section.dart';
import 'package:bni_event/screens/schedule/schedule_screen.dart';
import 'package:bni_event/screens/sponsors/sponsors_screen.dart';
import 'package:bni_event/sections/footer.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/utils/navigation_helper.dart';
import 'package:bni_event/widgets/navbar.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 70),
                MediaHeroSection(),
                MediaStorySection(),
                // Divider(height: 0.1, thickness: 0.1),
                // MediaAttendeesSection(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onScheduleTap: () {
                navigateSmoothly(context, const ScheduleScreen());
              },
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
              // Already on Media
            ),
          ),
        ],
      ),
    );
  }
}
