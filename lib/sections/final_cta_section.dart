import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/gradient_button.dart';

class FinalCTASection extends StatelessWidget {
  const FinalCTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
      child: Column(
        children: [
          const Text(
            'One Day. One Platform. Real Business Opportunities.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.headingGolden,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(
                text: 'Get Tickets',
                padding: 40,
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              GradientButton(
                text: 'Become a Partner',
                padding: 40,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
