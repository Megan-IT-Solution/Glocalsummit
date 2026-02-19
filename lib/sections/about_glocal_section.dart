import 'package:bni_event/sections/widgets/about_glocal_section_gradient_header.dart';
import 'package:bni_event/sections/widgets/about_glocal_summit_glass_card_widget.dart';
import 'package:bni_event/sections/widgets/about_glocal_summit_philosophy_card_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/dimensions.dart';
import '../utils/responsive_helper.dart';

class AboutGlocalSection extends StatelessWidget {
  const AboutGlocalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&q=80&w=1472',
          ),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          aboutGlocalSectionGradientHeader(
            "What Does “Glocal” Mean?",
            isMobile,
          ),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              "“Glocal” represents the integration of local business strength with global vision — where businesses grow by combining local execution with broader perspectives.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 18 : 22,
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.6,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 60 : 100),

          if (!isMobile)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: aboutGlocalSummitGlassCardWidget(
                      title: "VISION",
                      content:
                          "To build a trusted, neutral, and scalable business platform that enables collaboration, visibility, and long-term growth for SMEs, startups, and organisations.",
                      icon: Icons.visibility_outlined,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: aboutGlocalSummitGlassCardWidget(
                      title: "MISSION",
                      content: "",
                      icon: Icons.rocket_launch_outlined,
                      points: [
                        "Support SMEs and startups through exposure and learning",
                        "Create structured business visibility opportunities",
                        "Encourage cross-industry collaboration",
                        "Enable partnerships beyond the event",
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            Column(
              children: [
                aboutGlocalSummitGlassCardWidget(
                  title: "VISION",
                  content:
                      "To build a trusted, neutral, and scalable business platform that enables collaboration, visibility, and long-term growth for SMEs, startups, and organisations.",
                  icon: Icons.visibility_outlined,
                ),
                const SizedBox(height: 20),
                aboutGlocalSummitGlassCardWidget(
                  title: "MISSION",
                  content: "",
                  icon: Icons.rocket_launch_outlined,
                  points: [
                    "Support SMEs and startups through exposure and learning",
                    "Create structured business visibility opportunities",
                    "Encourage cross-industry collaboration",
                    "Enable partnerships beyond the event",
                  ],
                ),
              ],
            ),

          SizedBox(height: isMobile ? 60 : 100),

          aboutGlocalSectionGradientHeader("PLATFORM PHILOSOPHY", isMobile),
          const SizedBox(height: 40),
          _buildPhilosophyGrid(isMobile, isTablet),

          const SizedBox(height: 60),
          Text(
            "GLOCAL Summit is where serious businesses connect, collaborate, and grow — locally rooted, globally aligned.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headingGolden,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyGrid(bool isMobile, bool isTablet) {
    final philosophies = [
      {
        "title": "Annual Institution",
        "desc": "Built as a recurring business landmark, not a one-off event.",
        "icon": Icons.account_balance_outlined,
        "image":
            "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=800",
      },
      {
        "title": "Neutral Platform",
        "desc":
            "A fair and open space for all industry leaders to collaborate.",
        "icon": Icons.handshake_outlined,
        "image":
            "https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&q=80&w=800",
      },
      {
        "title": "Natural Growth",
        "desc": "Where high-value business relationships form organically.",
        "icon": Icons.auto_graph_outlined,
        "image":
            "https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&q=80&w=800",
      },
    ];

    if (isMobile) {
      return Column(
        children: philosophies
            .map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: aboutGlocalSummitPhilosophyCardWidget(p),
              ),
            )
            .toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: philosophies
          .map(
            (p) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: aboutGlocalSummitPhilosophyCardWidget(p),
              ),
            ),
          )
          .toList(),
    );
  }
}
