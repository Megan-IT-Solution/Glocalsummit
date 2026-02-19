import 'package:bni_event/screens/contact_us/contact_us_screen.dart';
import 'package:bni_event/screens/edition_2026/editions_2026_screen.dart';
import 'package:bni_event/screens/expo/expo_screen.dart';
import 'package:bni_event/screens/media/media_screen.dart';
import 'package:bni_event/screens/schedule/schedule_screen.dart';
import 'package:bni_event/screens/sponsors/sponsors_screen.dart';
import 'package:bni_event/sections/about_glocal_section.dart';
import 'package:bni_event/sections/audience_section.dart';
import 'package:bni_event/sections/expo_highlight_section.dart';
import 'package:bni_event/sections/footer.dart';
import 'package:bni_event/sections/hero_section.dart';
import 'package:bni_event/sections/newsletter_section.dart';
import 'package:bni_event/sections/partners_section.dart';
import 'package:bni_event/sections/vision_section.dart';
import 'package:bni_event/sections/why_attend_section.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:bni_event/utils/navigation_helper.dart';
import 'package:bni_event/widgets/navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _navigateToSchedule() {
    navigateSmoothly(context, const ScheduleScreen());
  }

  void _navigateToContact() {
    navigateSmoothly(context, const ContactScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  onExhibitTap: () {
                    navigateSmoothly(context, const ExpoScreen());
                  },
                  onSponsorTap: () {
                    navigateSmoothly(context, const SponsorsScreen());
                  },
                ),
                VisionSection(),
                AboutGlocalSection(),
                AudienceSection(),
                ExpoHighlightSection(),
                WhyAttendSection(),
                Divider(thickness: 0.1, height: 0.1),
                PartnersSection(),
                NewsletterSection(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onScheduleTap: _navigateToSchedule,
              onContactTap: _navigateToContact,
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
