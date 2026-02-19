import 'package:flutter/material.dart';

class VisionFeatureCardWidget extends StatelessWidget {
  final String image;
  final bool isMobile;

  const VisionFeatureCardWidget({
    super.key,
    required this.image,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: isMobile
            ? Image.asset(image, fit: BoxFit.contain)
            : Container(
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}
