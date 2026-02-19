import 'package:bni_event/screens/home/home_screen.dart';
import 'package:bni_event/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/navigation_helper.dart';
import '../utils/responsive_helper.dart';
import '../utils/url_helper.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onScheduleTap;
  final VoidCallback? onContactTap;
  final VoidCallback? onEditionsTap;
  final VoidCallback? onExpoTap;
  final VoidCallback? onSponsorsTap;
  final VoidCallback? onMediaTap;

  const Navbar({
    super.key,
    this.onScheduleTap,
    this.onContactTap,
    this.onEditionsTap,
    this.onExpoTap,
    this.onSponsorsTap,
    this.onMediaTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 10),
      decoration: BoxDecoration(color: AppColors.primary),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                navigateSmoothly(context, const HomeScreen());
              },
              child: SizedBox(
                height: isMobile ? 60 : 150,
                width: isMobile ? 120 : 200,
                child: Image.asset(
                  "assets/logos/logo.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),

          // GestureDetector(
          //   onTap: () {
          //     navigateSmoothly(context, const HomeScreen());
          //   },
          //   child: SizedBox(
          //     height: isMobile ? 60 : 150,
          //     width: isMobile ? 120 : 220,
          //     child: Image.asset(
          //       "assets/logos/bni_logo.jpeg",
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          if (isMobile) ...[
            const Spacer(),
            _buildMobileMenu(context),
          ] else ...[
            const Spacer(),
            _buildDesktopMenu(context),
          ],
        ],
      ),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: AppColors.headingGolden,
      ),
      icon: Icon(Icons.menu, color: AppColors.primary, size: 28),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMobileNavItem(context, 'Home', () {
                    navigateSmoothly(context, const HomeScreen());
                  }),
                  _buildMobileNavItem(context, '2026 Edition', onEditionsTap),
                  _buildMobileNavItem(context, 'Schedule', onScheduleTap),
                  _buildMobileNavItem(context, 'Expo', onExpoTap),
                  _buildMobileNavItem(context, 'Sponsors', onSponsorsTap),
                  _buildMobileNavItem(context, 'Media', onMediaTap),
                  _buildMobileNavItem(context, 'Contact', onContactTap),
                  const SizedBox(height: 10),

                  Divider(),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavbarButton(
                        onPressed: () {
                          openUrl(
                            'https://glocalsummit.zohobackstage.com/GlocalSummit-2026#/buyTickets/selectTickets?lang=en',
                          );
                        },
                        title: 'Book a Ticket',
                        icon: Icons.book_sharp,
                      ),
                      SizedBox(width: 30),
                      NavbarButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onSponsorsTap?.call();
                        },
                        title: 'Sponsor/Partner with us',
                        icon: Icons.business,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileNavItem(
    BuildContext context,
    String title,
    VoidCallback? onTap,
  ) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.accent1,
      ),
      onTap: () {
        Navigator.pop(context);
        onTap?.call();
      },
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        _buildNavItem(
          'Home',
          onTap: () {
            navigateSmoothly(context, const HomeScreen());
          },
        ),
        _buildNavItem('2026 Edition', onTap: onEditionsTap),
        _buildNavItem('Schedule', onTap: onScheduleTap),
        _buildNavItem('Expo', onTap: onExpoTap),
        _buildNavItem('Sponsors', onTap: onSponsorsTap),
        _buildNavItem('Media', onTap: onMediaTap),
        _buildNavItem('Contact', onTap: onContactTap),
        const SizedBox(width: 15),
        NavbarButton(
          onPressed: () {
            openUrl(
              "https://glocalsummit.zohobackstage.com/GlocalSummitUAE-2026#/buyTickets/selectTickets?lang=en",
            );
          },
          title: 'Get Tickets',
          icon: Icons.book_sharp,
        ),
        const SizedBox(width: 15),
        NavbarButton(
          onPressed: onSponsorsTap,
          title: 'Sponsor / Partner with us',
          icon: Icons.business,
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  Widget _buildNavItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.headingGolden,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
