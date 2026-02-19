import 'dart:async';

import 'package:bni_event/utils/url_helper.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/dimensions.dart';
import '../utils/responsive_helper.dart';
import '../widgets/gradient_button.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onExhibitTap;
  final VoidCallback? onSponsorTap;

  const HeroSection({super.key, this.onExhibitTap, this.onSponsorTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final List<String> _banners = const [
    'assets/images/a1.jpeg',
    'assets/images/a2.jpeg',
    'assets/images/a3.jpeg',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % _banners.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final double height = isMobile ? 650 : (isTablet ? 670 : 700);
    final bool isDesktopLayout = !isMobile;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ...List.generate(_banners.length, (index) {
            return AnimatedOpacity(
              key: ValueKey<String>(_banners[index]),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              opacity: index == _currentIndex ? 1 : 0,
              child: Container(
                color: AppColors.primary,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Image.asset(_banners[index]),
                ),
              ),
            );
          }),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.75),
                ],
              ),
            ),
          ),

          Padding(
            padding: Dimensions.getSectionPadding(context),
            child: Align(
              alignment: isDesktopLayout
                  ? Alignment.centerLeft
                  : Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktopLayout ? 560 : double.infinity,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isDesktopLayout
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      if (isMobile) const SizedBox(height: 20),
                      SizedBox(
                        height: isMobile ? 130 : (isTablet ? 170 : 190),
                        width: isMobile ? 230 : (isTablet ? 320 : 360),
                        child: Image.asset(
                          'assets/logos/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 0),
                      Text(
                        "A Premier Business & Entrepreneurial Growth Platform "
                        "GLOCAL Summit UAE 2026 is a flagship, full-day business summit designed to bring together business owners, founders, entrepreneurs, startups, and decision-makers on one powerful platform."
                        "This is a curated business environment focused on networking, collaboration, partnerships, visibility, and real business opportunities — not random networking.",
                        textAlign: isDesktopLayout
                            ? TextAlign.left
                            : TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 12 : (isTablet ? 14 : 16),
                          height: 1.7,
                        ),
                      ),
                      SizedBox(height: isMobile ? 22 : 28),
                      if (isMobile)
                        Column(
                          children: [
                            _infoBadge(
                              Icons.location_on,
                              'Shangri-La Hotel, Dubai - UAE',
                              isMobile,
                            ),
                            const SizedBox(height: 12),
                            _infoBadge(
                              Icons.calendar_month,
                              '31 January 2026',
                              isMobile,
                            ),
                            const SizedBox(height: 12),
                            _infoBadge(
                              Icons.schedule,
                              '9:00 AM - 4:00 PM',
                              isMobile,
                            ),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoBadge(
                              Icons.location_on,
                              'Shangri-La Hotel, Dubai - UAE',
                              isMobile,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _infoBadge(
                                  Icons.calendar_month,
                                  '31 January 2026',
                                  isMobile,
                                ),
                                const SizedBox(width: 24),
                                _infoBadge(
                                  Icons.schedule,
                                  '9:00 AM - 4:00 PM',
                                  isMobile,
                                ),
                              ],
                            ),
                          ],
                        ),
                      SizedBox(height: isMobile ? 20 : 25),
                      isMobile
                          ? Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: _buildHeroButtons(isMobile),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                      _buildHeroButtons(isMobile)
                                          .expand(
                                            (w) => [
                                              w,
                                              const SizedBox(width: 14),
                                            ],
                                          )
                                          .toList()
                                        ..removeLast(),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBadge(IconData icon, String text, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: isMobile ? 18 : 20),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14 : 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildHeroButtons(bool isMobile) {
    return [
      GradientButton(
        text: 'Get Tickets',
        padding: isMobile ? 15 : 30,
        onPressed: () {
          openUrl(
            "https://glocalsummit.zohobackstage.com/GlocalSummitUAE-2026#/buyTickets/selectTickets?lang=en",
          );
        },
      ),
      GradientButton(
        text: 'Exhibit Your Business',
        padding: isMobile ? 15 : 30,
        onPressed: widget.onExhibitTap ?? () {},
      ),
      GradientButton(
        text: 'Sponsor / Partner with us',
        padding: isMobile ? 15 : 30,
        onPressed: widget.onSponsorTap ?? () {},
      ),
    ];
  }
}
