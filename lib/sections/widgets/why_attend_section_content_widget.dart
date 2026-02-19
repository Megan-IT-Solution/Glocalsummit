import 'package:flutter/material.dart';

import '../../utils/url_helper.dart';
import '../../widgets/gradient_button.dart';

Widget whyAttendSectionContentWidget(bool isMobile, bool isTablet) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Why will business leaders gather in Dubai?',
        style: TextStyle(
          fontSize: isMobile ? 28 : (isTablet ? 32 : 36),
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 30),
      Text(
        'GLOCAL Summit 2026 will bring together the people and companies redefining the global business landscape. Join us in Dubai to make meaningful connections, find your next business partner, or learn from the best in the business.',
        style: TextStyle(
          fontSize: isMobile ? 16 : 18,
          color: Colors.black,
          height: 1.6,
        ),
      ),
      SizedBox(height: isMobile ? 30 : 40),
      GradientButton(
        text: 'Get Tickets',
        padding: isMobile ? 20 : 20,
        onPressed: () {
          openUrl(
            "https://glocalsummit.zohobackstage.com/GlocalSummitUAE-2026#/buyTickets/selectTickets?lang=en",
          );
        },
      ),
    ],
  );
}
