import 'package:bni_event/screens/contact_us/contact_us_screen.dart';
import 'package:bni_event/screens/edition_2026/sections/editions_2026_content_section.dart';
import 'package:bni_event/screens/edition_2026/sections/editions_2026_hero_section.dart';
import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/screens/media/media_screen.dart';
import 'package:bni_event/screens/schedule/schedule_screen.dart';
import 'package:bni_event/screens/sponsors/sponsors_screen.dart';
import 'package:bni_event/sections/footer.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/utils/navigation_helper.dart';
import 'package:bni_event/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Editions2026Screen extends StatelessWidget {
  const Editions2026Screen({super.key});

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
                Editions2026HeroSection(),
                EditionsContentSection(),

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
              // We are already on 2026 Editions, so no onEditionsTap needed or it can be a no-op
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
