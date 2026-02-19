import 'package:bni_event/models/sponsor_model.dart';
import 'package:bni_event/screens/sponsors/widgets/partner_logo_card_widget.dart';
import 'package:bni_event/utils/lists.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../utils/responsive_helper.dart';

class SponsorsContentSection extends StatelessWidget {
  const SponsorsContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 40 : 80,
          horizontal: isMobile
              ? 15
              : 30, // Reduced from Dimensions.getSectionPadding
        ),
        child: Column(
          children: [
            Text(
              'Our Sponsors & Partners',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 60),

            _buildPyramidRow(titleSponsors, isMobile, true),
            const SizedBox(height: 45),

            _buildPyramidRow(
              associateSponsors,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Associate Sponsor',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              platinumSponsors,
              isMobile,
              false,
              customWidth: isMobile ? 200 : 280,
              sectionTitle: 'Platinum Sponsors',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              goldSponsors,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: 'Gold Sponsors',
            ),
            const SizedBox(height: 45),
            _buildPyramidRow(
              eventPartners,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Event Partners',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              entertainmentPartners,
              isMobile,
              false,
              customWidth: isMobile ? 180 : 250,
              sectionTitle: 'Entertainment Partners',
            ),
            const SizedBox(height: 45),

            // GOLD SUPPORT SPONSORS GROUP
            _buildPyramidRow(
              goldSupportSponsorsRow1,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230, // Normal width for 4 in a line
              sectionTitle: 'Gold Support Sponsors BNI Orion',
            ),
            const SizedBox(height: 25), // Tight spacing between grouped rows
            _buildPyramidRow(
              goldSupportSponsorsRow2,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: '', // Suppress title for 2nd row
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              goldSupportSponsorsConcordsRow1,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: 'Gold Support Sponsors BNI Concords',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              goldSupportSponsorsConcordsRow2,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: '',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              goldSupportSponsorsConcordsRow3,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: '',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              goldSupportSponsorsInnovatorsRow1,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Gold Support Sponsors BNI Innovators',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              goldSupportSponsorsInnovatorsRow2,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: '',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              goldSupportSponsorsMavericks,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Gold Support Sponsors BNI Mavericks',
            ),
            const SizedBox(height: 45),

            _buildPyramidRow(
              goldSupportSponsorsOasis,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Gold Support Sponsors BNI Oasis',
            ),

            const SizedBox(height: 45),

            _buildPyramidRow(
              tableSponsorsOasis,
              isMobile,
              false,
              customWidth: isMobile ? 160 : 230,
              sectionTitle: 'Table Sponsor BNI Oasis',
            ),

            const SizedBox(height: 45),

            _buildPyramidRow(
              stallSponsorsOasisRow1,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: 'Stall Sponsors BNI Oasis',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              stallSponsorsOasisRow2,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: '',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              stallSponsorsOasisRow3,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: '',
            ),
            const SizedBox(height: 25),
            _buildPyramidRow(
              stallSponsorsOasisRow4,
              isMobile,
              false,
              customWidth: isMobile ? 140 : 180,
              sectionTitle: '',
            ),
            const SizedBox(height: 45),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildPyramidRow(
    List<SponsorModel> sponsors,
    bool isMobile,
    bool isPremium, {
    double? customWidth,
    double? customHeight,
    String? sectionTitle,
  }) {
    return Column(
      children: [
        if (sectionTitle != null && sectionTitle.isNotEmpty) ...[
          Text(
            sectionTitle.toUpperCase(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: isMobile ? 14 : 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
        ],
        Wrap(
          alignment: WrapAlignment.center,
          spacing: isMobile ? 15 : 20,
          runSpacing: isMobile ? 40 : 50,
          children: sponsors
              .map(
                (sponsor) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (sponsor.category != null && sectionTitle == null) ...[
                      Text(
                        sponsor.category!.toUpperCase(),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: isMobile ? 14 : 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                    ],
                    PartnerLogoCardWidget(
                      sponsor: sponsor,
                      isMobile: isMobile,
                      isPremium: isPremium,
                      customWidth: customWidth,
                      customHeight: customHeight,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
