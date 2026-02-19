import 'package:bni_event/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/contact_us/contact_us_screen.dart';
import '../screens/edition_2026/editions_2026_screen.dart';
import '../screens/expo/expo_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/media/media_screen.dart';
import '../screens/schedule/schedule_screen.dart';
import '../screens/sponsors/sponsors_screen.dart';
import '../theme/colors.dart';
import '../utils/dimensions.dart';
import '../utils/navigation_helper.dart';
import '../utils/responsive_helper.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          isMobile || isTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandingSection(context, isMobile),
                    const SizedBox(height: 40),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildBrandingSection(context, isMobile),
                    ),
                  ],
                ),
          SizedBox(height: isMobile ? 40 : 60),
          Divider(color: Colors.white.withOpacity(0.1)),
          SizedBox(height: isMobile ? 20 : 40),
          isMobile
              ? Column(
                  children: [
                    const Text(
                      '© GLOCAL Summit | All Rights Reserved',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Follow us:',
                          style: TextStyle(color: Colors.white54),
                        ),
                        _socialIcon(Icons.facebook, () {
                          openUrl(
                            "https://www.facebook.com/profile.php?id=61586784593577",
                          );
                        }),
                        _socialIcon(FontAwesomeIcons.instagram, () {
                          openUrl("https://www.instagram.com/glocalsummituae/");
                        }),
                        _socialIcon(FontAwesomeIcons.youtube, () {
                          openUrl('https://www.youtube.com/@Glocalsummit2026');
                        }),
                        _socialIcon(FontAwesomeIcons.linkedin, () {
                          openUrl(
                            'https://www.linkedin.com/company/glocal-summit-uae/',
                          );
                        }),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Text(
                      '© GLOCAL Summit | All Rights Reserved',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const Spacer(),
                    const Text(
                      'Follow us:',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(width: 20),
                    _socialIcon(Icons.facebook, () {
                      openUrl(
                        "https://www.facebook.com/profile.php?id=61586784593577",
                      );
                    }),
                    _socialIcon(FontAwesomeIcons.instagram, () {
                      openUrl("https://www.instagram.com/glocalsummituae/");
                    }),
                    _socialIcon(FontAwesomeIcons.youtube, () {
                      openUrl('https://www.youtube.com/@Glocalsummit2026');
                    }),
                    _socialIcon(FontAwesomeIcons.linkedin, () {
                      openUrl(
                        'https://www.linkedin.com/company/glocal-summit-uae/',
                      );
                    }),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildBrandingSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GLOCAL Summit',
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: AppColors.headingGolden,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: isMobile ? 20 : 40,
          runSpacing: 20,
          children: [
            _footerLink(
              context,
              'About Glocal Summit',
              () => navigateSmoothly(context, const HomeScreen()),
            ),
            _footerLink(
              context,
              '2026 Edition',
              () => navigateSmoothly(context, const Editions2026Screen()),
            ),
            _footerLink(
              context,
              'Agenda',
              () => navigateSmoothly(context, const ScheduleScreen()),
            ),
            _footerLink(
              context,
              'Expo',
              () => navigateSmoothly(context, const ExpoScreen()),
            ),
            _footerLink(
              context,
              'Sponsors',
              () => navigateSmoothly(context, const SponsorsScreen()),
            ),
            _footerLink(
              context,
              'Media',
              () => navigateSmoothly(context, const MediaScreen()),
            ),
            _footerLink(
              context,
              'Contact',
              () => navigateSmoothly(context, const ContactScreen()),
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildNewsletterSection(bool isMobile) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Newsletter',
  //         style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //           color: AppColors.headingGolden,
  //         ),
  //       ),
  //       const SizedBox(height: 20),
  //       const Text(
  //         'Get the latest GLOCAL Summit news delivered to your inbox.',
  //         style: TextStyle(color: Colors.white70),
  //       ),
  //       const SizedBox(height: 20),
  //       isMobile
  //           ? Column(
  //               children: [
  //                 TextField(
  //                   style: const TextStyle(color: Colors.white),
  //                   decoration: InputDecoration(
  //                     hintText: 'Enter your email',
  //                     hintStyle: const TextStyle(color: Colors.white54),
  //                     filled: true,
  //                     fillColor: Colors.white.withOpacity(0.1),
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(4),
  //                       borderSide: BorderSide.none,
  //                     ),
  //                     contentPadding: const EdgeInsets.symmetric(
  //                       horizontal: 15,
  //                       vertical: 15,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: GradientButton(
  //                     text: 'Subscribe',
  //                     padding: 15,
  //                     onPressed: () {},
  //                   ),
  //                 ),
  //               ],
  //             )
  //           : Row(
  //               children: [
  //                 Expanded(
  //                   child: TextField(
  //                     style: const TextStyle(color: Colors.white),
  //                     decoration: InputDecoration(
  //                       hintText: 'Enter your email',
  //                       hintStyle: const TextStyle(color: Colors.white54),
  //                       filled: true,
  //                       fillColor: Colors.white.withOpacity(0.1),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(4),
  //                         borderSide: BorderSide.none,
  //                       ),
  //                       contentPadding: const EdgeInsets.symmetric(
  //                         horizontal: 15,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 10),
  //                 GradientButton(
  //                   text: 'Subscribe',
  //                   padding: 20,
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //     ],
  //   );
  // }

  Widget _footerLink(BuildContext context, String text, VoidCallback onTap) {
    return _TextHoverLink(text: text, onTap: onTap);
  }

  Widget _socialIcon(IconData icon, VoidCallback onTap) {
    return _SocialHoverIcon(icon: icon, onTap: onTap);
  }
}

class _TextHoverLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _TextHoverLink({required this.text, required this.onTap});

  @override
  State<_TextHoverLink> createState() => _TextHoverLinkState();
}

class _TextHoverLinkState extends State<_TextHoverLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? AppColors.headingGolden : Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialHoverIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialHoverIcon({required this.icon, required this.onTap});

  @override
  State<_SocialHoverIcon> createState() => _SocialHoverIconState();
}

class _SocialHoverIconState extends State<_SocialHoverIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()..scale(_isHovered ? 1.2 : 1.0),
            child: Icon(
              widget.icon,
              color: _isHovered ? AppColors.headingGolden : Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
