import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/screens/media/media_screen.dart';
import 'package:bni_event/screens/schedule/schedule_screen.dart';
import 'package:bni_event/screens/sponsors/sponsors_screen.dart';
import 'package:bni_event/screens/contact_us/sections/contact_hero_section.dart';
import 'package:bni_event/screens/contact_us/sections/contact_section.dart';
import 'package:bni_event/sections/footer.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/utils/navigation_helper.dart';
import 'package:flutter/material.dart';

import '../../widgets/navbar.dart';
import '../edition_2026/editions_2026_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                ContactHeroSection(),
                ContactSection(),
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
              onContactTap: () {},
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
